<#
.Description
    Module built on: 2026-09-15 11:23:55Z
#>

#region Module.Before.ps1


#endregion Module.Before.ps1


#region Private Module Functions


#endregion Private Module Functions


#region Public Functions

function Write-MdHeader {
    <#
    .SYNOPSIS
        Writes Md headers, like <h1>, <h2>, etc.
    #>
    [CmdletBinding()]
    param(
        [string] $Text,
        [Alias('Depth')] [int] $Level = 1
    )
    $prefix = '#' * $Level -join ''
    "${Prefix} ${Text}"
}


#endregion Public Functions


#region Module.After.ps1


#endregion Module.After.ps1

