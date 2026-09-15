<#
.SYNOPSIS
    Unload, Rebuild, and Import module as global
#>
Remove-module Marking* -ea ignore

$error.clear()
. (Join-Path $PSScriptRoot './build.ps1' )
Import-Module -Scope Global -force -Passthru (Join-Path $PSScriptRoot './Marking.psd1' )
