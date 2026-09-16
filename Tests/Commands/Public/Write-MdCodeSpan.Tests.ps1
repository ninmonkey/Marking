Describe 'Write-MdCodeSpan' {
    Context 'Span: <Text>' -ForEach @(
        @{
            Text = 'x = 0xff'
            Expected = '`x = 0xff`'
            | NormalizeLineEnding
        }
    ) {
        It 'By Param Name is: <Expected>' {
            $actual = Write-MdCodeSpan -Text $Text | NormalizeLineEnding
            $actual | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
        It 'By Param Pos is: <Expected>' {
            $actual = Write-MdCodeSpan $Text | NormalizeLineEnding
            $actual | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
        It 'By Pipeline is: <Expected>' {
            $Text
                | Write-MdCodeSpan
                | NormalizeLineEnding
                | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
    }
    Context 'Escaped Content <Text>' {
        It '(nyi) Auto escape nested backticks etc in codepan' -Skip {
            # test cases from the specs: https://spec.commonmark.org/current
        }
    }
}
