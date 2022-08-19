
$AppConfig = @{
    Root = Get-Item .
}
goto $AppConfig.Root # not redundant if ConfigHash isn't overwritten

$AppConfig += @{
    ExportDoc   = Get-Item ( Join-Path $AppConfig.Root 'docs')
    ImportTrace = Join-Path $AppConfig.Root 'input_traces'
}

function invokeParseLog {
    # super quick sketch
    function relPath {
        param(
            [Parameter(Mandatory, Position = 0)]
            [string]$Path
        )
        Join-Path $AppConfig.ImportTrace $Path
    }
    # Build Docs

    relpath 'help'

}

invokeParseLog -Infa Continue
