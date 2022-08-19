$Paths = @{ Root = Get-Item $PSScriptRoot }
$Paths += @{
    Export = Join-Path $Paths.Root '.output/compare.md'
}
[object[]]$Results = @() # sorry


$results += @(
    [pscustomobject]@{
        Result  = Trace-NinCommand {
            ForEach-Object -InputObject (Get-Date) -Process ToString
        }
        Command = @'
ForEach-Object -InputObject (get-date) -Process ToString
'@
    }
)

$results += @(
    [pscustomobject]@{
        Result  = Trace-NinCommand {
            (Get-Date).ToString()
        }
        Command = @'
(get-date).ToString()
'@
    }
)

$results += @(
    [pscustomobject]@{
        Result  = Trace-NinCommand {
            Get-Date | ForEach-Object ToString
        }
        Command = @'
Get-Date | ForEach-Object ToString
'@
    }
)
[string]$str = ''

$results | ForEach-Object {
    $cur = $_
    $Template = @'
## {1}

```powershell
{0}
```

'@
    $str += $Template -f @(
        $cur
    )

}
