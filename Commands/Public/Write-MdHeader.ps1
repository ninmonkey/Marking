function Write-MdHeader {
    <#
    .SYNOPSIS
        Writes Md headers, like <h1>, <h2>, etc.
    #>
    [CmdletBinding()]
    param(
        [string] $Text,
        [Alias('Depth')] [int] $Level = 1
    )
    $prefix = '#' * $Level -join ''
    "${Prefix} ${Text}"
}
