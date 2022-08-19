
$AppConfig = @{
    Root = Get-Item .
}
goto .

$AppConfig += @{
    ExportDoc = Get-Item ( Join-Path $AppConfig.Root 'docs')
}

function invokeBuildDocs {
    param(
        [Hashtable]$Options = @{}
    )
    # super quick sketch
    function relPath {
        param(
            [Parameter(Mandatory, Position = 0)]
            [string]$Path
        )
        Join-Path $AppConfig.ExportDoc $Path
    }

    $Config = @{
        RebuildSubCommands = $false
        RebuildReadmeIndex = $true
    }
    $Config = Ninmonkey.Console\Join-Hashtable $Config $Options
    'config'
    $COnfig | Format-Table -auto


    # Build Docs

    relpath 'help' | Write-Verbose

    Invoke-NativeCommand 'dotnet-trace' -Args @('--help')
    | sc -path (relpath 'help.root.txt')
    | Write-Information

    "wrote: '{0}'" -f @(relpath 'help.root.txt')
    | Write-Information


    if ($Config.RebuildSubCommands) {
        $subCommands = @(
            'collect', 'ps', 'list-profiles', 'convert', 'report'
        )
        Invoke-NativeCommand 'dotnet-trace' -Args @('--help')
        | sc -path (relpath 'help.root.txt')
        | Write-Information

        foreach ($sub in $subCommands) {

            Invoke-NativeCommand 'dotnet-trace' -Args @(
                $Sub, '--help'
            )
            | sc -path (relpath "help.${sub}.txt")

            "wrote: '{0}'" -f @(
                relpath "help.${sub}.txt"
            )
            | Write-Information
        }
    }
    if ($Config.RebuildReadmeIndex) {

        $meta = @{
            PathIndex = relPath 'readme.md'
        }

        $strB = [System.Text.StringBuilder]::New()

        $buff = @'
auto_toc

## docs: dotnet-trace

version: {0}

## sub commands



'@ -f @(

            Invoke-NativeCommand 'dotnet-trace' -Args @(
                '--version'
            )
        )
        # check out appendFormat instead
        # $strB.AppendFormat
        [void]$strB.Append($buff)

        $links = Get-ChildItem $AppConfig.ExportDoc *.txt | ForEach-Object {
            $name = $_.BaseName
            $url_relativeRoot = ($_ | To->RelativePath ) -split '\\' -join '/'
            $url_relativeIndex = ($_ | To->RelativePath -BasePath $Meta.PathIndex ) -split '\\' -join '/'

            '[{0}]({1})' -f @( # markdownUriTemplate
                $Name
                $url_relativeIndex
            )
        }

        $buff = $links | Join-String -sep "`n - " -op "`n - " -os "`n"
        [void]$strB.Append($buff)

        $strB.ToString() | sc -path $meta.PathIndex

        "wrote: '{0}'" -f @(
            $meta.PathIndex
        ) | Write-Information
    }



}

invokeBuildDocs -Infa Continue -Options @{
    RebuildSubCommands = $true
}
