$App = @{ Root = $PSScriptRoot }
$Re = @{}
function _path {
    param([string]$name)
    Join-Path $App.Root $Name
}


& {
    param (
        [switch]$RenderHost = $True
    )
    $src = Get-Item -ea stop (_path 'man_extension_host.log')
    $dest = (_path 'man_extension_host-parsed.log')
    # $dest | gi | gocode

    "writing $Dest"

    $re.DateToEnd = @'
(?-x)
    ^(.*?
        \[
    )
    (.*)$
'@
    Get-Content -Path $Src | ForEach-Object {
        $line = $_ -replace $Re.DateToEnd, "`n$2`n`t$1"
        if ($PassThru) {
            $line | Write-Information
        }
        $Line
    } | Set-Content -Path $dest -PassThru:$RenderHost
} | s -first 10
