Describe 'Write-MdHeader' {
    It 'Text: "<Text>", Level: <Level>' -ForEach @(
        @{
            Text     = 'Title'
            Level    = 1
            Expected = '# Title'
        }
        @{
            Text     = 'Name'
            Level    = 3
            Expected = '### Name'
        }
    ) {
        $actual = Write-MdHeader -Text $Text -Level $Level
        $actual | Should-BeString -Expected $Expected
    }

}
