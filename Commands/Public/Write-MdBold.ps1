function Write-MdBold {
    <#
    .SYNOPSIS
        Writes Md Bold / strong text, like <strong>
    .example
        'file list:' | Write-MdBold
        # **file list:**
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Header text
        [Parameter(ValueFromPipeline)]
        [string] $Text
    )
    process {
        '**{0}**' -f $Text
    }
}
