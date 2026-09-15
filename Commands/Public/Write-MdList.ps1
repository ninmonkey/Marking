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
