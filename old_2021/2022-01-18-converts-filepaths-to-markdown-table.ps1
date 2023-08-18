
function _buildFolderList {
    # orig: <C:\Users\cppmo_000\SkyDrive\Documents\2021\Powershell\buffer_format_prototype\string joins and filepaths\2022-01-18-converts-filepaths-to-markdown-table.ps1>
    # returns list of directories as markdown links
    [cmdletbinding()]
    param()

    $target = Get-Item -ea stop 'C:\Users\cppmo_000\SkyDrive\Documents\2021\Powershell\My_Github\Mini.Examples\Parsing Native Apps'

    $ignoredPathRegex = Join-Regex -LiteralText '.node_modules', '.git', '.output', '.export'
    $directDir = Get-ChildItem -Path $Target -Dir -Force
    | Where-Object {
        $_.Name -notmatch $ignoredPathRegex
    } | ForEach-Object Name | Sort-Object -Unique

    $render = $directDir
    | ForEach-Object {
        '[{0}]({1})' -f @(
            $_
            $_
        )
        | str ul
    }
    $render

    $DestPath = Join-Path 'C:\Users\cppmo_000\SkyDrive\Documents\2021\Powershell\My_Github\Mini.Examples\Parsing Native Apps' '.output/links.md'
    $render | set-content $DestPath
    $DestPath | Label 'wrote ->'
}
