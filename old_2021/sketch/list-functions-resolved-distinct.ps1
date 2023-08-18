h1 'example'

$query = '*prop*', '*enum*'
Get-Command -Module Ninmonkey.Console $query | resCmd -q | str ul -Sort -Unique

<#
outputs

    - Ninmonkey.Console\_enumerateMyModule
    - Ninmonkey.Console\ConvertTo-PropertyList
    - Ninmonkey.Console\Get-EnumInfo
    - Ninmonkey.Console\Get-NinVerb
    - Ninmonkey.Console\Get-ObjectProperty
    - Ninmonkey.Console\Get-StaticProperty
    - Ninmonkey.Console\Select-NinProperty
#>