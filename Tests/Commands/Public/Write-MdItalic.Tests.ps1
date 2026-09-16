Describe 'Write-MdItalic' {
    Context 'Italic: <Text>' -ForEach @(
        @{
            Text = 'File List:'
            Expected = '*File List:*'
            | NormalizeLineEnding
        }
    ) {
        It 'By Param Name is: <Expected>' {
            $actual = Write-MdItalic -Text $Text | NormalizeLineEnding
            $actual | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
        It 'By Param Pos is: <Expected>' {
            $actual = Write-MdItalic $Text | NormalizeLineEnding
            $actual | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
    }
    Context 'Escaped Content <Text>' {
        It '(nyi) AutoLink invalid chars nested in Italic' -Skip {
            # test cases from the specs: https://spec.commonmark.org/current
        }
    }
}
