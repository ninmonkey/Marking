Describe 'Write-MdList' {
    Context 'From Pipeline' {
        It 'List <Text>' -ForEach @(
            @{
                Text     = 0..2
                Expected = @'
- 0
- 1
- 2

'@ | NormalizeLineEnding
            }
            @{
                Text     = @(
                    '<a href="toc">toc</a>'
                    '<a href="foo">foo</a>'
                )
                Expected = @'
- <a href="toc">toc</a>
- <a href="foo">foo</a>

'@ | NormalizeLineEnding
            }
        ) {
            # note: I want exact whitespace (other than line endings)
            # using Normalize because "Should-BeString -Expected .. -NormalizeLineEnding" only normalizes the final one, not all line endings.
            $actual = Write-MdList -Text $Text | NormalizeLineEnding
            $actual | Should-BeString -Expected $Expected # -TrimWhitespace # -NormalizeLineEnding
        }
    }
    Context 'From Param' {
        It 'List Equals' -Skip {

        }
    }
}
