using namespace System.Collections.Generic
$AppPath = @{ Root = Get-Item $PSScriptRoot }
[List[object]]$ComMap = [list[object]]::new()

function GenerateMapping {
    <#
    .synopsis
        COM typing experiment
    #>
}
$ObjectNames = @(
    'Shell.Application'
    'WScript.Shell'
    'WScript.Network'
    'Scripting.Dictionary'
    'Scripting.FileSystemObject'
)

$ObjectNames | ForEach-Object {
    $Regex_IsComTypeName = ( [regex]::escape('#{')) + '.*' + ( [regex]::Escape('}') )
    $Name = $_
    $ObjInstance = New-Object -ComObject $Name
    $Map = $ObjInstance.pstypenames -match $Regex_IsComTypeName | Select-Object -First 1
    $meta = @{
        'Name'    = $Name
        'ComName' = $Map
    }
    $comMap.Add( $meta )
}
#  New-Object -ComObject Shell.Applicatio
h1 'export table'
& {
    $MdPath = Join-Path $AppPath.Root 'Com-Mapping-test.md'
    $content = @(
        'Name', 'ComName' | str Table
        '-', '-' | str Table
        $ComMap | ForEach-Object {
            $_.Name, $_.ComName | str Table

        }
    ) | str nl
    $content | sc -path $MdPath -Encoding utf8
    "Wrote: '$MdPath'" | write-color 'orange'
}
& {
    $JsonPath = Join-Path $AppPath.Root 'Com-Mapping-test.json'
    $ComMap | to->Json -EnumsAsStrings
    | sc -path $JsonPath -Encoding utf8
    "Wrote: '$JsonPath'" | write-color 'orange'

}

h1 'stuff'
$ComMap

$ComMap | to->json | bat -l json -p -f

return



[hashtable]$ComMap = @{}
function GenerateMapping {
    <#
    .synopsis
        COM typing experiment
    #>
}
@(
    'Shell.Application'
    'WScript.Shell'
    'WScript.Network'
    'Scripting.Dictionary'
    'Scripting.FileSystemObject'
) | ForEach-Object {
    $Name = $_
    $Map = '??'
    $meta = @{
        'Name'    = $Name
        'ComName' = $Map
    }

    $ComMap[ $Name ] = $meta
}


$ComMap | Format-Table
