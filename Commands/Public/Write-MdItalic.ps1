function Write-MdItalic {
    <#
    .SYNOPSIS
        Writes Italic text
    .example
        'foo bar' | Write-MdItalic
        # *foo bar*
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Header text
        [Parameter(ValueFromPipeline)]
        [string] $Text
    )
    process {
        '*{0}*' -f $Text
    }
}
