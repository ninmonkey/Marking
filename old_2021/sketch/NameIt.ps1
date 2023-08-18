#Requires -Version 7
#Requires -Module NameIt
Import-Module NameIt


[hashtable]$SampleStr = @{
    FakeISBN = '978-3-16-148410-0'
}
[hashtable]$Template = @{}
function convertFrom-ExampleNumber {
    <#
    .synopsis
        sample convertTo NameIt template
    #>
    param(
        # InputObject
        [Parameter(position = 0, ValueFromPipeline)]
        [string]$InputObject
    )
    process {
        $InputObject -replace '\d', '#'
    }
}

h1 'ISBN or any numbers'

$Template.FakeISBN = $SampleStr.FakeISBN | convertFrom-ExampleNumber



function invoke-ExampleNameItTemplate {
    <#
    .link
        NameIt\New-NameItTemplate
    .link
        C:\Users\cppmo_000\SkyDrive\Documents\PowerShell\Modules\NameIt\2.3.2\Public\New-NameItTemplate.ps1
    #>
    param(
        [string]$Template, [int]$Count = 3
    )

    h1 ($Template | Join-String -DoubleQuote)

    ig $Template -Count $Count


}

# ig $Template.FakeISBN -count 4
invoke-ExampleNameItTemplate $Template.FakeISBN

hr
h1 'New-NameItTemplate addresss'

$z = (New-NameItTemplate { [PSCustomObject]@{Company = ''; Name = ''; Age = 0; address = ''; state = ''; zip = '' } })
ig $z -Count 5 -AsPSObject | Format-Table