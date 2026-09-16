Describe 'Write-MdHorizontalRule' {
    It 'is <Expected>' -ForEach @(
        @{
            Expected = "`n---`n"
                | NormalizeLineEnding
        }
    ) {
        Write-MdHorizontalRule
            | NormalizeLineEnding
            | Should-BeString -Expected $Expected

    }
}
