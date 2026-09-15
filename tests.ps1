<#
.synopsis
    main pester testing for CI. Runs path: ./Tests/Commands/*
.NOTES
reference: https://pester.dev/docs/usage/configuration

Pester runs another script before every file/container here:
    <file:///./Pester.BeforeContainer.ps1>
#>
param(
)
#region pester config
$PSStyle.OutputRendering = 'Host'
$error.clear()

$script:MyPesterConfig = @{}

$script:Config = New-PesterConfiguration

$Config.Output.Verbosity     = 'Detailed' # valid: None | [Normal] | Detailed | Diagnostic
$Config.Run.Exit = $true # run the tests, write both artifacts, exit non-zero if anything failed. ( see: https://pester.dev/tutorial/ci/test-script )
$Config.Output.StackTraceVerbosity = 'Filtered' # valid: None | FirstLine | [Filtered] | Full
$Config.Output.CIFormat        = 'Auto'  # valid: None | [Auto] | AzureDevOps | GithubActions
$Config.Output.RenderMode      = 'Auto'  # valid: [Auto] | Ansi | ConsoleColor | PlainText
$Config.Output.ShowTags        = $true
$Config.Debug.ShowStartMarkers = $false   # shows names of long-running tests that are stuck

$Config.TestResult.Enabled   = $true
$Config.CodeCoverage.Enabled = $false

$Config.Run.Path          = @(
    './Tests'
)
$Config.CodeCoverage.Path = @(
    './Tests'
)

$Config.TestResult.OutputPath   = './testResults.xml'
$Config.CodeCoverage.OutputPath = './coverage.xml'

if( $false ) {
    # update global value?
    $global:PesterPreference = New-PesterConfiguration
    $PesterPreference.Output.Verbosity = 'Detailed'
}

#endregion pester config

# always rebuild module at least once
#   Maybe redundant with Pester.BeforeContainer.ps1
. ( Join-Path $PSScriptRoot './Build.ps1')

Invoke-Pester -Configuration $Config

#region post-testing end
# log if/where files were saved
if( $Config.CodeCoverage.Enabled ) {
    "wrote: `"${fg:blue}$( $config.CodeCoverage.OutputPath.Value )${fg:clear}`""
}
if( $Config.TestResult.Enabled ) {
    "wrote: `"${fg:blue}$( $config.TestResult.OutputPath.Value )${fg:clear}`""
}
#endregion post-testing end
