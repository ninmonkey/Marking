function _StringBuilder.Append {
     <#
    .SYNOPSIS
        [internal] Append [StringBuilder] reference else shared. Outputs nothing.
    .DESCRIPTION
        No output. Writes to the explicit, else fallback string builder.
    #>
    [Alias('_Sb.Append')]
    [CmdletBinding()]
    [OutputType( [Void] )]
    param(
        # objects to append to string
        [Parameter(ValueFromPipeline)]
            [object[]] $InputObject,

        # Write output to StringBuilder else the module fallback StringBuilder
        [Parameter(Position = 0)]
            [Alias('Sb', 'StringBuilder')]
            [Text.StringBuilder] $StrBuilder = $Null,

        # When input is an array, join on this string
        [Alias('Delimiter')]
            [String] $Separator = ''
    )
    end {
        $items = @( $InputObject )
        $strB  = $StrBuilder ?? $script:__SbDefault
        $null  = $strB.AppendJoin( $Separator, $items )
        $null  = $strB.AppendLine()
    }
}
