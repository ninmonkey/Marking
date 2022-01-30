# br 2
hr -fg gray30
$AppPath = @{ Root = Get-Item $PSScriptRoot }
$AppPath += @{
    ExportRoot = Join-Path $AppPath.Root '.output'
}
function _resetIndexCache {
    # reset cached values since this run
    $script:IndexAllFiles.Keys, $script:AllPs1.count | Label 'Was: '
    $script:IndexAllFiles = $null
    $script:allPs1 = $null

}
$IndexAllFiles ??= @{

}

function _indexPath {
    <#
    .synopsis
        find all 'ps1' files
    .description
        use 'fd' or 'everythingSearch' for speed for indexing
        then this parses / ETLs the output
    .example
        PS> $x = _indexPath -PSPath '.' -Extension ps1 -infa Continue
    #>
    [cmdletbinding()]
    [outputType('[object[]]')]
    param(
        # root directory to query
        [Alias('PSPath', 'Path')]
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [object]$BasePath,

        # what type
        [Parameter(Mandatory, Position = 1)]
        [ArgumentCompletions('ps1', 'pq', 'md', 'json', 'js', 'cs', 'csx', 'log')]
        [string]$Extension = 'ps1'
    )

    process {
        Write-Information "'$BasePath' with '$Extension'"
        $root = Get-Item $BasePath -ea stop

        Push-Location -StackName 'dev.Index' -Path $BasePath

        [object[]]$foundItem ??= @(
            fd -e $Extension --color never | Get-Item
        ) | Sort-Object LastWriteTime

        Pop-Location -StackName 'dev.Index'

        "Found $($foundItem.Count) files of '$Extension'"
        | Write-Information

        $dbg = [Ordered]@{
            Extension = $Extension #| To->RelativePath
            BasePath  = $BasePath #| To->RelativePath
            Root      = $root
            Found     = $foundItem.count
        } | Out-Default | Wi
        hr | wi
        # $dbg | format-dict | Out-String | wi
        $dbg | Out-Default | wi

        $foundItem
    }

}

'Start' | Write-Color 'green'
$x = _indexPath -PSPath '.' -Extension ps1 -infa Continue
'Done' | Write-Color 'green'
