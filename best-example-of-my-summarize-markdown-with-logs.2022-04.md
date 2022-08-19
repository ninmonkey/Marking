# To export


```ps1
$Regex = @{
            StripColor = '\u001B.*?m'
            StripAll   = '\u001B.*?\p{L}'
        }

$serr = $error[0..3]
$serr | Get-Error | out-string -w 180 | %{ $_ 
# alias select
```

# About 

![image](https://user-images.githubusercontent.com/3892031/163446907-dcfa65eb-2ecf-4eb5-975a-d3b6c75bd828.png)


After importing `ugit` you are unable to call `Get-FormatData` without errors. 

- this occurs for previously valid calls
- sometimes it seemed to persist after `Remove-Module 'ugit'`, but not always

# To Reproduce

## `[InvalidCastException]` Short Version [Top](#show_issue)

- this is *not* a function because I wanted to rule out scoping issues -- when importing from a function / lower scope.

```ps1
Pwsh7> pwsh -Nop

Pwsh7> 
$mod = 'bitstransfer'
Remove-Module $mod
$A1 = Get-FormatData
Import-Module $mod -Force

$B1 = Get-FormatData
$diff1 = Compare-Object $A1 $B1

$mod = 'ugit'
Remove-Module $mod
$A1 = Get-FormatData
Import-Module $mod -Force

$B1 = Get-FormatData
$diff1 = Compare-Object $A1 $B1

$mod = 'bitstransfer'
Remove-Module $mod
$A1 = Get-FormatData
Import-Module $mod -Force

$B1 = Get-FormatData
$diff1 = Compare-Object $A1 $B1
```
## `[InvalidCastException]` Full Version [Top](#show_issue)


<details><summary>Summary (Click to Expand) <b>+70 Lines</b>


```ps1

Import-Module $mod -Force

$B = Get-FormatData
$diff1 = Compare-Object $A $B

 ... 🠯 Click to Expand +70 lines 🠯 ...
```


</summary>


Click to Expand 🠯



```ps1
... 🠯 Continued From Above 🠯 ...

Pwsh7> pwsh -Nop

##  ----

Pwsh7> 


$mod = 'ugit'
$mod = 'bitstransfer'
"Module: $mod"

if (Get-Module -ea Ignore -Name $Mod) {
    Remove-Module $mod
}
$A = Get-FormatData
Import-Module $mod -Force

$B = Get-FormatData
$diff1 = Compare-Object $A $B

##  ----

Pwsh7> 


$mod = 'ugit'
$mod = 'bitstransfer'
"Module: $mod"

if (Get-Module -ea Ignore -Name $Mod) {
    Remove-Module $mod
}
$A = Get-FormatData
Import-Module $mod -Force

$B = Get-FormatData
$diff1 = Compare-Object $A $B

##  ----

Pwsh7> 


$mod = 'ugit'
#$mod = 'bitstransfer'
"Module: $mod"

if (Get-Module -ea Ignore -Name $Mod) {
    Remove-Module $mod
}
$A = Get-FormatData
Import-Module $mod -Force

$B = Get-FormatData
$diff1 = Compare-Object $A $B

##  ----

Pwsh7> 


$mod = 'ugit'
$mod = 'bitstransfer'
"Module: $mod"

if (Get-Module -ea Ignore -Name $Mod) {
    Remove-Module $mod
}
$A = Get-FormatData
Import-Module $mod -Force

$B = Get-FormatData
$diff1 = Compare-Object $A $B
```

</details>

----


## Log `[InvalidCastException]` [Top](#show_issue)
[Top](#show_issue)

<details><summary>Error Log (Click to Expand <b>+90 Lines</b>)

```ps1
$Regex = @{
    StripColor = '\u001B.*?m'
    StripAll   = '\u001B.*?\p{L}'
}

$error | Get-Error | out-string -w 180
| %{ $_ -replace $Regex.StripAll, '' } | Set-Clipboard
```
```yml
PositionMessage  : At line:12 char:6
                    + $B = Get-FormatData
                    +      ~~~~~~~~~~~~~~
InvocationName   : Get-FormatData
CommandOrigin    : Internal

                 ...
```


Click to Expand 🠯

</summary>


```yml
Exception             : 
    Type       : System.InvalidCastException
    TargetSite : 
        Name          : ChkCast_Helper
        DeclaringType : System.Runtime.CompilerServices.CastHelpers, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e
        MemberType    : Method
        Module        : System.Private.CoreLib.dll
    Message    : Unable to cast object of type 'Microsoft.PowerShell.Commands.Internal.Format.ControlReference' to type 
'Microsoft.PowerShell.Commands.Internal.Format.ComplexControlBody'.
    Source     : System.Private.CoreLib
    HResult    : -2147467262
    StackTrace : 
   at System.Management.Automation.CustomItemBase.Create(FormatToken token)
   at System.Management.Automation.CustomControlEntry..ctor(ComplexControlEntryDefinition entry)
   at System.Management.Automation.CustomControl..ctor(ComplexControlBody body, ViewDefinition viewDefinition)
   at Microsoft.PowerShell.Commands.GetFormatDataCommand.ProcessRecord()
   at System.Management.Automation.CommandProcessor.ProcessRecord()
CategoryInfo          : NotSpecified: (:) [Get-FormatData], InvalidCastException
FullyQualifiedErrorId : System.InvalidCastException,Microsoft.PowerShell.Commands.GetFormatDataCommand
InvocationInfo        : 
    MyCommand        : Get-FormatData
    ScriptLineNumber : 12
    OffsetInLine     : 6
    HistoryId        : 17
    Line             : $B = Get-FormatData

    PositionMessage  : At line:12 char:6
                       + $B = Get-FormatData
                       +      ~~~~~~~~~~~~~~
    InvocationName   : Get-FormatData
    CommandOrigin    : Internal
ScriptStackTrace      : at <ScriptBlock>, <No file>: line 12
Exception             : 
    Type       : System.InvalidCastException
    TargetSite : 
        Name          : ChkCast_Helper
        DeclaringType : System.Runtime.CompilerServices.CastHelpers, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e
        MemberType    : Method
        Module        : System.Private.CoreLib.dll
    Message    : Unable to cast object of type 'Microsoft.PowerShell.Commands.Internal.Format.ControlReference' to type 
'Microsoft.PowerShell.Commands.Internal.Format.ComplexControlBody'.
    Source     : System.Private.CoreLib
    HResult    : -2147467262
    StackTrace : 
   at System.Management.Automation.CustomItemBase.Create(FormatToken token)
   at System.Management.Automation.CustomControlEntry..ctor(ComplexControlEntryDefinition entry)
   at System.Management.Automation.CustomControl..ctor(ComplexControlBody body, ViewDefinition viewDefinition)
   at Microsoft.PowerShell.Commands.GetFormatDataCommand.ProcessRecord()
   at System.Management.Automation.CommandProcessor.ProcessRecord()
CategoryInfo          : NotSpecified: (:) [Get-FormatData], InvalidCastException
FullyQualifiedErrorId : System.InvalidCastException,Microsoft.PowerShell.Commands.GetFormatDataCommand
InvocationInfo        : 
    MyCommand        : Get-FormatData
    ScriptLineNumber : 9
    OffsetInLine     : 6
    HistoryId        : 17
    Line             : $A = Get-FormatData

    PositionMessage  : At line:9 char:6
                       + $A = Get-FormatData
                       +      ~~~~~~~~~~~~~~
    InvocationName   : Get-FormatData
    CommandOrigin    : Internal
ScriptStackTrace      : at <ScriptBlock>, <No file>: line 9
Exception             : 
    Type       : System.InvalidCastException
    TargetSite : 
        Name          : ChkCast_Helper
        DeclaringType : System.Runtime.CompilerServices.CastHelpers, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e
        MemberType    : Method
        Module        : System.Private.CoreLib.dll
    Message    : Unable to cast object of type 'Microsoft.PowerShell.Commands.Internal.Format.ControlReference' to type 
'Microsoft.PowerShell.Commands.Internal.Format.ComplexControlBody'.
    Source     : System.Private.CoreLib
    HResult    : -2147467262
    StackTrace : 
   at System.Management.Automation.CustomItemBase.Create(FormatToken token)
   at System.Management.Automation.CustomControlEntry..ctor(ComplexControlEntryDefinition entry)
   at System.Management.Automation.CustomControl..ctor(ComplexControlBody body, ViewDefinition viewDefinition)
   at Microsoft.PowerShell.Commands.GetFormatDataCommand.ProcessRecord()
   at System.Management.Automation.CommandProcessor.ProcessRecord()
CategoryInfo          : NotSpecified: (:) [Get-FormatData], InvalidCastException
FullyQualifiedErrorId : System.InvalidCastException,Microsoft.PowerShell.Commands.GetFormatDataCommand
InvocationInfo        : 
    MyCommand        : Get-FormatData
    ScriptLineNumber : 12
    OffsetInLine     : 6
    HistoryId        : 16
    Line             : $B = Get-FormatData

    PositionMessage  : At line:12 char:6
                       + $B = Get-FormatData
                       +      ~~~~~~~~~~~~~~
    InvocationName   : Get-FormatData
    CommandOrigin    : Internal
ScriptStackTrace      : at <ScriptBlock>, <No file>: line 12
```

</details>

[Top](#show_issue)