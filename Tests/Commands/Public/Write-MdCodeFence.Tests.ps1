Describe 'Write-MdCodeFence' {
    Context 'CodeFence: <Text>' -ForEach @(
        @{
            Language = 'Powershell'
            Text = @'
$x = 10
$y = "`u{2400}"
'@
            Expected = @'

```Powershell
$x = 10
$y = "`u{2400}"
```

'@
            | NormalizeLineEnding
        }
    ) {
        It 'By Param Name is: <Expected>' {
            Write-MdCodeFence -Text $Text -Language $Language
                | NormalizeLineEnding
                | Should-BeString -Expected $Expected
        }
        It 'By Param Pos is: <Expected>' {
            $Text | Write-MdCodeFence -Language $Language
                | NormalizeLineEnding
                | Should-BeString -Expected $Expected
        }
    }
    It 'By Pipeline' {
        $Expected = @'

~~~
foo
bar
~~~

'@

        'foo', 'bar'
        | Write-MdCodeFence -Character '~'
        | NormalizeLineEnding
        | Should-BeString -Expected $Expected
    }

    Context 'Escape Contents<Url>' {
        It '(nyi) Anything to escape in fence?' -Skip {
            # test cases from the specs: https://spec.commonmark.org/0.31.2/#autolinks
        }
    }
}
