function _Test-HtmlElementIsVoidElement {
    <#
    .SYNOPSIS
        Is element a known HTML void element, like <img>, <hr>, <br>, etc...
    #>
    [OutputType( [bool] )]
    param(
        [Alias('TagName')]
        [string] $ElementName
    )
    $regex_IsKnownVoidElement =
        @('area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'link', 'meta', 'source', 'track', 'wbr')
            | Mint.New-RegexOr -FullMatch -EscapeRegex

    $ElementName -match $regex_IsKnownVoidElement
}
