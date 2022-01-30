# Powershell notes: Terminating Errors

source: <C:\Users\cppmo_000\SkyDrive\Documents\2021\Powershell\My_Github\Mini.Examples\Error-Handling\PwshTerminatingError.notes.md>

- [Powershell notes: Terminating Errors](#powershell-notes-terminating-errors)
  - [misc](#misc)
    - [Error Identifiers](#error-identifiers)
    - [Types and functions](#types-and-functions)

## misc

### Error Identifiers

- [https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/windows-powershell-error-records?view=powershell-7#error-identifier](https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/windows-powershell-error-records?view=powershell-7#error-identifier)
- exists as property `[ErrorRecord].FullyQualifiedErrorId`

`[System.Management.Automation.Cmdlet].WriteError()`

- [https://docs.microsoft.com/../non-terminating-errors?view=powershell-7](https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/non-terminating-errors?view=powershell-7)
- [https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/non-terminating-errors?view=powershell-7](https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/non-terminating-errors?view=powershell-7)

### Types and functions

- [System.Management.Automation.ErrorRecord]
- [System.Management.Automation.Cmdlet]
- [System.Management.Automation.Cmdlet].WriteError(..)
- [System.Management.Automation.Cmdlet].Throwterminatingerror(..)

<!-- old format?
- [System.Management.Automation.ErrorRecord]
- [System.Management.Automation.Cmdlet]
- [System.Management.Automation.Cmdlet].WriteError(..)
- [System.Management.Automation.Cmdlet].Throwterminatingerror(..)
-->