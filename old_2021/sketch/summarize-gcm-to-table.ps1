$myCmds ??= Get-Command -m (_enumerateMyModule )

hr -fg magenta
$myCmds | Sort-Object ModuleName, Name
| f 3
| str md

hr -fg magenta

$myCmds | Sort-Object ModuleName, Name
| f 3

hr -fg magenta

$sources ??= $myCmds #| Sort-Object ModuleName, Name
| dict Name | Sort-Object ModuleName, Name

hr -fg magenta

$sources
| s -First 3 | ConvertTo-Yaml

hr -fg magenta


$sources
| s -First 3 | ConvertTo-Json

hr -fg magenta
