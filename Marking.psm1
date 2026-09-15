<#
.Description
    Module built on: 2026-09-15 11:52:24Z
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
        # Header text
        [string] $Text,

        # Header depth. The number of '#'. ( Default: 1 )
        [ArgumentCompletions(1, 2, 3, 4, 5, 6)]
        [Alias('Depth')]
        [int] $Level = 1
    )
    end {
        $prefix = '#' * $Level -join ''
        "${Prefix} ${Text}"
    }
}

function Write-MdList {
    <#
    .SYNOPSIS
        Writes Md lists, - item 1
    #>
    [CmdletBinding()]
    param(
        # Header text
        [Parameter(ValueFromPipeline)]
        [Alias('InputObject', 'Content')]
        [object[]] $Text
    )
    begin {
        [Text.StringBuilder] $sb  = ''
        $ListIcon = '-'
    }
    process {
        foreach( $Item in $Text ) {
            [void] $sb.AppendFormat("{0} {1}`n", $ListIcon, $Item)
        }
    }
    end {
        return $sb.ToString()
    }
}


#endregion Public Functions


#region Module.After.ps1


#endregion Module.After.ps1

