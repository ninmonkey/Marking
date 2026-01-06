function Write-MarkingMdHeader {
     <#
    .SYNOPSIS
        Markdown: Header levels
    .link
        System.Text.StringBuilder
    #>
    [Alias(
        'Mark.Md.Write-Header',
        'Mark.Md.Header'
    )]
    [OutputType( [string] )]
    param(
        [Parameter(Mandatory)]
            [Alias('Content', 'Title')]
            [string] $Name,

        [Alias('Depth')]
            [ArgumentCompletions(1, 2, 3, 4, 5, 6)]
            [Int] $Level = 1,

        # Write output to StringBuilder else the module fallback StringBuilder
        [Parameter()]
            [Alias('Sb', 'StringBuilder')]
            [Text.StringBuilder] $StrBuilder = $Null
    )
    begin {
        [bool] $IsUsingStrBuilderRef = $PSBoundParameters.ContainsKey( 'StrBuilder' )
        [Text.StringBuilder] $strB  = ''
        if( $null -ne $StrBuilder ) { $strB = $StrBuilder }

        $blocks = '#' * $Level -join ''
        $null = $strB.Append( "${blocks} ${Name}`n" )

        if( -not $IsUsingStrBuilderRef ) {
            $strB.ToString()
        }

    }
    process {

    }
}
