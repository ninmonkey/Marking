function Write-MdLink {
    <#
    .SYNOPSIS
        Writes Md Links / Urls, like [Title](Url)
    #>
    [CmdletBinding()]
    param(
        # Header text
        [Parameter(Mandatory)]
        [Alias('Name')]
        [object] $Title,

        # Currently accepts any Url because sometimes you want invalid urls
        [ArgumentCompletions(
            "'#top'",
            "'file:///c/some%20file.md'",
            "'file.md'"
        )]
        [Parameter(Mandatory)]
        [Alias('Link', 'Uri')]
        [string] $Url
    )
    end {
        return '[{0}]({1})' -f $Title, $Url
    }
}
