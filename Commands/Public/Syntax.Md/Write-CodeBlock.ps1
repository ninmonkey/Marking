function Write-MarkingMdCodeBlock {
     <#
    .SYNOPSIS
        Markdown: CodeBlock with language
    .link
        System.Text.StringBuilder
    #>
    [Alias(
        'Mark.Md.Write-CodeBlock',
        'Mark.Md.Fence',
        'Mark.Md.CodeBlock'
    )]
    [OutputType( [string] )]
    param(
        [Parameter(Position = 0)]
        [ArgumentCompletions( 'cs', 'css', 'csv', 'html', 'js', 'md', 'ps1', 'ts', 'xml' )]
        [string] $LanguageName = '',

        [Alias('InputObject')]
        [Parameter(ValueFromPipeline)]
        [string[]] $TextContent,

        [Parameter()]
        [Alias('Sb', 'StringBuilder')]
        [Text.StringBuilder] $StrBuilder = $Null
    )
    begin {
        [Text.StringBuilder] $fence  = ''
        if( $null -ne $StrBuilder ) { $fence = $StrBuilder }

        $triple = '```'
        $null = $fence.Append("${triple}${LanguageName}`n" )

        [bool] $IsUsingStrBuilderRef = $PSBoundParameters.ContainsKey( 'StrBuilder' )
    }
    process {
        foreach($line in $TextContent ) {
            $null = $fence.Append( "${line}`n" )
        }
    }
    end {
        $null = $fence.Append( "${triple}`n" )

        # if no StrBuilder was passed, output the string. otherwise silent.
        if( -not $IsUsingStrBuilderRef ) {
            $fence.ToString()
        }
    }
}
