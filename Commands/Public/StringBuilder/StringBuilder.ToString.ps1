function Marking.StringBuilder.ToString {
     <#
    .SYNOPSIS
        Outputs the [StringBuilder] as a string
    .notes
        never throws or errors, when using null values
    #>
    [Alias(
        # '_Sb.ToString',
        # 'Mark.StrBuilder.ToString',
        'Mark.StringBuilder.ToString',
        'Mark.Sb.ToString'
    )]
    [CmdletBinding()]
    [OutputType( [string] )]
    param(
        # Read from StringBuilder else the module fallback StringBuilder
        [Parameter(Position = 0)]
            [Alias('Sb', 'StringBuilder')]
            [Text.StringBuilder] $StrBuilder = $Null
    )
    end {
        $strB = $StrBuilder ?? $script:__SbDefault
        ( $strB )?.ToString() ?? ''
    }
}
