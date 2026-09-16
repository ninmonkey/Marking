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
}
