function Write-MdLink {
    <#
    .SYNOPSIS
        Writes Md Links / Urls, like [Title](Url)
    .example
        Write-MdLink -Title 'Back to TOC' -Url '#toc'
        # out: [Back to TOC](#toc)
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
        $Url = $Url | Escape-LinkUrl
        return '[{0}]({1})' -f $Title, $Url
    }
}
