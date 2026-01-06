function _StringBuilder.Clear {
     <#
    .SYNOPSIS
        [internal] Clears [StringBuilder] reference else shared fallback StringBuilder. Outputs nothing.
    .DESCRIPTION
        No output. Writes to the explicit, else fallback string builder.
    #>
    [Alias('_Sb.Clear')]
    [CmdletBinding()]
    [OutputType( [Void] )]
    param(
        # Write output to StringBuilder else the module fallback StringBuilder
        [Parameter(Position = 0)]
            [Alias('Sb', 'StringBuilder')]
            [Text.StringBuilder] $StrBuilder = $Null
    )
    end {
        $strB = $StrBuilder ?? $script:__SbDefault
        $null = $strB.clear()
    }
}
