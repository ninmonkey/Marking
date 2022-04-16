$t = New-Object -ComObject Shell.Application
$t | Get-Member
$T

@'
others:
New-Object -ComObject Shell.Application
New-Object -ComObject WScript.Shell
New-Object -ComObject WScript.Network
New-Object -ComObject Scripting.Dictionary
New-Object -ComObject Scripting.FileSystemObject
System.__ComObject#{24be5a31-edfe-11d2-b933-00104b365c9f}

'@
# wanted

$ComMapping = @(
    @{
        From = '__ComObject#{286e6f1b-7113-4355-9562-96b7e9d64c54}'
        To   = 'Shell.Application'
    }
)

Write-Warning '
    1] Now convert JSON to COM type accelerators

    2] functions become
        function foo { param( [COM.Shell.Application]$Input ) }


    2] ooh, could this be a good place to use
        derivable parameter attributes?
'

Function Add-TypeAcclerator {
    <#
    .notes
        ref: https://adamtheautomator.com/powershell-data-types/

    .example
        $addTypeAccleratorSplat = @{
            acceleratorName = 'FileInfo'
            acceleratorClassName = 'System.IO.FileSystemInfo'
        }

        Add-TypeAcclerator @addTypeAccleratorSplat
        Add-TypeAcclerator -acceleratorName FileInfo -acceleratorClassName System.IO.FileSystemInfo
    #>
    param(
        [string]$acceleratorName,
        [string]$acceleratorClassName
    )

    $accel = [PowerShell].assembly.gettype('System.Management.Automation.TypeAccelerators')
    $accleratorAdd = "`$accel::Add(`"$acceleratorName`",[$acceleratorClassName])"
    Invoke-Expression $accleratorAdd
    $builtinField = $accel.Getfield('builtinTypeAccelerators', [System.Reflection.BindingFlags]'Static,NonPublic')
    $builtinField.SetValue($builtinField, $accel::Get)
}

'done'
