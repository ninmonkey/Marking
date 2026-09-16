Describe 'Write-MdBold' {
    Context 'Bold: <Text>' -ForEach @(
        @{
            Text = 'File List:'
            Expected = '**File List:**'
            | NormalizeLineEnding
        }
    ) {
        It 'By Param Name is: <Expected>' {
            $actual = Write-MdBold -Text $Text | NormalizeLineEnding
            $actual | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
        It 'By Param Pos is: <Expected>' {
            $actual = Write-MdBold $Text | NormalizeLineEnding
            $actual | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
    }
    Context 'Escaped Content <Text>' {
        It '(nyi) AutoLink invalid chars nested in bold' -Skip {
            # test cases from the specs: https://spec.commonmark.org/current
        }
    }
}
