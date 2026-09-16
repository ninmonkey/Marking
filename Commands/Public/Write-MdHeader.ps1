function Write-MdHeader {
    <#
    .SYNOPSIS
        Writes Md headers, like <h1>, <h2>, etc.
    #>
    [OutputType( [string] )]
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
