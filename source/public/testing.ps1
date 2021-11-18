
. (Join-Path $PSScriptRoot 'Marking.ps1')


if ($false) {
    # $mdDoc += New-MarkdownHeader -InputText "Mode: '$Mode'"
    $mdDoc += Write-Newline 2
    
    $result = $settings | ConvertTo-Json
    $result
    $mdDoc += New-MarkdownCodeFence $result -Language json

    $result = PSScriptAnalyzer\Invoke-Formatter -ScriptDefinition $script -Settings $settings
    $result
    $mdDoc += New-MarkdownCodeFence $result -Language ps1
    $mdDoc += Write-Newline 2

    Set-Content -Path 'temp:\md.md' -Value $mdDoc
    if ($AlwaysOpen) {
        code-venv -p (Get-Item temp:\md.md)
    }
}
