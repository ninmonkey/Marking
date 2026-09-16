Describe 'Write-MdLink' {
    Context 'Link: <Title>, Url: <Url>' -ForEach @(
        @{
            Title    = 'toc'
            Url      = '#toc'
            Expected = @'
[toc](#toc)
'@
            | NormalizeLineEnding
        }
        @{
            Title    = 'readme'
            Url      = 'c:\user data\file.md'
            Expected = @'
[readme](c:\user%20data\file.md)
'@
            | NormalizeLineEnding
        }
        @{
            Title    = ''
            Url      = 'https://pester.dev/docs/commands/InModuleScope'
            Expected = '<https://pester.dev/docs/commands/InModuleScope>'
            | NormalizeLineEnding
        }
    ) {
        It 'By Param Name is: <Expected>' {
            $actual = Write-MdLink -Title $Title -Url $Url | NormalizeLineEnding
            $actual | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
        It 'By Param Pos is: <Expected>' {
            $actual = Write-MdLink $Title $Url | NormalizeLineEnding
            $actual | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
    }
    Context 'Autolink <Url>' {
        It '(nyi) AutoLink grammar tests' -Skip {
            # test cases from the specs: https://spec.commonmark.org/0.31.2/#autolinks
            # An absolute URI, for these purposes, consists of a scheme followed by a colon (:) followed by zero or more characters other than ASCII control characters, space, <, and >. If the URI includes these characters, they must be percent-encoded (e.g. %20 for a space).

            # For purposes of this spec, a scheme is any sequence of 2–32 characters beginning with an ASCII letter and followed by any combination of ASCII letters, digits, or the symbols plus (“+”), period (“.”), or hyphen (“-”).
        }
    }
}
