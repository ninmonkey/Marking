<#
.synopsis
    Pester file ran before every container
.NOTES
reference: https://pester.dev/docs/usage/configuration

See main test entry point:
    <file:///./tests.ps1>
#>
$script:MyModuleName = 'Marking'

$MyPesterContainerConfig = @{
    EnableLogMockDebug  = $false
    AlwaysRebuildModule = $false
}

# reference: https://pester.dev/docs/usage/configuration

$PSStyle.OutputRendering = 'Host'

# shared imports
Import-Module -Force ( Gi -ea 'stop' (  Join-Path $PSScriptRoot 'Tests/test_helpers.psm1' ) )

if( $MyPesterContainerConfig.AlwaysRebuildModule ) {
    # running rebuild is redundant here, if you came from '/tests.ps1'
    .\Build.ps1
}

# force importing new module
Import-Module "$PSScriptRoot/${MyModuleName}.psd1" -Force

if( $MyPesterContainerConfig.EnableLogMockDebug ) {
    $PesterPreference.Debug.WriteDebugMessages = $true
    $PesterPreference.Debug.WriteDebugMessagesFrom = "Mock"
}
