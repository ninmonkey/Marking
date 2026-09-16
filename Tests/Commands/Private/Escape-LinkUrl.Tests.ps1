Describe 'Escape-LinkUrl' {
    It 'Text: "<Text>" is <Expected>' -ForEach @(
        @{
            Text     = 'Hi Wor  ld'
            Expected = 'Hi%20Worl%20%20ld'
        }
    ) {
        InModuleScope Marking {
            $Text | Escape-LinkUrl | Should-BeString $Expected
        }
    }
}
