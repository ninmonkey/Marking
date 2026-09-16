function Write-MdCodeSpan {
    <#
    .SYNOPSIS
        Writes Md Code Span, like <code>
    .example
        'x = 0xff' | Write-MdCodeSpan
        # <code>x = 0xff</code>
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Code to wrap
        [Parameter(ValueFromPipeline)]
        [string] $Text
    )
    process {
        '`{0}`' -f $Text
    }
}
