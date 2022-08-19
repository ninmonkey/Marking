using namespace System.Collections.Generic

function pprint_list {
    <#
    .synopsis
        pretty print array, with colored to distinguish foldable region
    .description
        'low level' means  minimal dependencies
    .notes
        requires: Pansies
    .example
            $all_files = Get-ChildItem .
            $selectedFiles = $all_files | Select-Object -First 14

            pprint_list -Items $selectedFiles #-label '....'

            $selectedFiles | ForEach-Object Name | pprint_list -label 'go 2'
    .example
        # there's colors
        (ls . -Name | sort LastWriteTime -Descending | select -First 10 )
        | pprint_list
    #>
    param(
        [Alias('Items')]
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [object[]]$InputObject,

        [alias('Name')]
        [Parameter()]
        [string]$Label = '' # ex: 'items'

    )

    begin {
        [List[object]]$allItems = [list[object]]::new()
        $CStyle = @{}


        # too bright
        $CStyle.BrightBold = $prefixTextSplat = @{
            ForegroundColor = 'gray30'
            BackgroundColor = 'gray60'
            Object          = '    '
        }
        $CStyle.Other = $prefixTextSplat = @{
            ForegroundColor = 'gray30'
            BackgroundColor = 'gray60'
            Object          = '    '
        }

        $CStyle.Darkest = $prefixTextSplat = @{
            ForegroundColor = 'gray10'
            BackgroundColor = 'gray20'
            Object          = '    '
        }

        # nice inner dim
        $CStyle.dimText = $innerTextSplat = @{
            ForegroundColor = 'gray60'
            BackgroundColor = 'gray30'
        }
        #  = $innerTextSplat

        $strPrefixArray = New-Text @prefixTextSplat
        | ForEach-Object tostring
        # $strArrayHeader.Remove( ('object')

        $strArrayHeader = $strPrefixArray
        $strOutPrefix = @(
            "${strPrefixArray}"
            "${bg:gray20}"
            "${Label}"
            "${bg:\gray30}"
            "= [`n"
            "${fg:clear}${bg:clear}"
        ) -join ''

        $joinStringSplat = @{
            Separator    = "`n${strPrefixArray}"
            # OutputPrefix = "${strPrefixArray}SortedImports = [`n"
            OutputPrefix = $strOutPrefix
            OutputSuffix = "`n]"
            Property     = {
                $_propName = $null
                $target = ($_propName) ? ($_.$_propName) : ($_)
                $_
                # $_.FullName
                # | To->RelativePath
                | New-Text @innerTextSplat | ForEach-Object tostring
            }
        }


        # $strPrefixArray
    }
    process {
        $allItems.AddRange($InputObject)
    }
    end {
        $allItems
      | Join-String @joinStringSplat

    }
}



if ($true) {
    # Example usage
    $Error.clear()
    $all_files = Get-ChildItem . -Depth 2
    $selectedFiles = $all_files | Select-Object -First 14

    pprint_list -Items $selectedFiles -Label 'FullPath'

    $selectedFiles
    | ForEach-Object { $_.FullName * 3 | Join-String -os "`n" }
    | pprint_list -label 'Test Super long wrapping -- with ending'

    $selectedFiles
    | ForEach-Object { $_.FullName * 3 | Join-String }
    | pprint_list -label 'Test Super long wrapping -- No End'

    $selectedFiles
    | ForEach-Object { $_.FullName * 3 | Join-String -os "`n" }
    | pprint_list -label 'Name_Only '
    # ...
}
