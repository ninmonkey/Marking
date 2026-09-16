function Write-MdLink {
    <#
    .SYNOPSIS
        Writes Md Links / Urls, like [Title](Url)
    .example
        Write-MdLink -Title 'Back to TOC' -Url '#toc'
        # out: [Back to TOC](#toc)
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Header text ( optional )
        [Alias('Name')]
        [object] $Title,

        # Url to link to.
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
        # If title is missing, write <autolink.html> format
        if( [string]::IsNullOrWhitespace( $Title )  ) {
            return "<${Url}>"
        }

        $Url = $Url | Escape-LinkUrl
        return '[{0}]({1})' -f $Title, $Url
    }
}
