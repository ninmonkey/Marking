Hr -fg magenta
$RawOrigActual = [ENvironment]::GetCommandLineArgs()

$RawOrig = @'
 C:\Program Files\PowerShell\7\pwsh.dll
-NoProfile
-NonInteractive
-ExecutionPolicy
Bypass
-Command
Import-Module 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\modules\PowerShellEditorServices\PowerShellEditorServices.psd1'; Start-EditorServices -HostName 'Visual Studio Code Host' -HostProfileId 'Microsoft.VSCode' -HostVersion '2021.12.0' -AdditionalModules @('PowerShellEditorServices.VSCode') -BundledModulesPath 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\modules' -EnableConsoleRepl -StartupBanner '' -LogLevel 'Diagnostic' -LogPath 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\logs\1651186010-7e7269f3-521a-4c19-bb01-4a5191b402131651166797206\EditorServices.log' -SessionDetailsPath 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\sessions\PSES-VSCode-7040-936637' -FeatureFlags @()
'@
$NL = "`n"
$NullSybol = "`u{2400}"

write-warning

. {
    $accum = $RawOrig
    $script:TotalLogs++
    $Accum = $Accum -replace ';', $NL
    H1 '[iter0] colorize whitespace'
    $Accum = $Accum -replace '([ ]+)', {
        "${bg:gray25}", $_, "${bg:clear}"
    }
    $accum
}

. {
    $accum = $RawOrig
    $script:TotalLogs++
    $Accum = $Accum -replace ';', $NL
    H1 '[iter1]colorize the rest?'
    $Accum = $Accum -replace '([ ]+)', {
        "${bg:gray25}", $_, "${bg:clear}"
    }
    # $Accum = $Accum -replace '([^ ]+)', {
    #     "${bg:gray80}", $_, "${bg:clear}"
    # }
    $accum
}

$finalCommand = $RawOrig -split '\n?\n' | Select-Object -Last 1


. {
    $accum = $RawOrig
    $script:TotalLogs++
    $RawOrig -replace '\r?\n', "$NL$NL"

    Hr -fg yellow
    $accum
}

$ExMeta = $ExampleMeta = [ordered]@{
    ModulePath =
    LogLevel = 'Diagnostic'
    'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\modules\PowerShellEditorServices\PowerShellEditorServices.psd1'
    BundledModulPath = 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\modules'
    LogPath = 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\logs\1651186010-7e7269f3-521a-4c19-bb01-4a5191b402131651166797206\EditorServices.log'
    SessionDetailsPath = 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\sessions\PSES-VSCode-7040-936637'
    FeatureFlags = @()

}



# c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\modules\PowerShellEditorServices\PowerShellEditorServices.psd1
# todo -> parse as ast ?
# example payload
{
    Import-Module 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\modules\PowerShellEditorServices\PowerShellEditorServices.psd1'; $startEditorServicesSplat = @{
        HostName           = 'Visual Studio Code Host'
        HostProfileId      = 'Microsoft.VSCode'
        HostVersion        = '2021.12.0'
        AdditionalModules  = @('PowerShellEditorServices.VSCode')
        BundledModulesPath = 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\modules'
        EnableConsoleRepl  = $true
        StartupBanner      = ''
        LogLevel           = 'Diagnostic'
        LogPath            = 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\logs\1651186010-7e7269f3-521a-4c19-bb01-4a5191b402131651166797206\EditorServices.log'
        SessionDetailsPath = 'c:\Users\cppmo_000\.vscode\extensions\ms-vscode.powershell-2021.12.0\sessions\PSES-VSCode-7040-936637'
        FeatureFlags       = @()
    }

    Start-EditorServices @startEditorServicesSplat
}