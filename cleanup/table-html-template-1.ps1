

[hashtable]$Paths = @{
    ExportHtml = 'temp:\out.html'
    AppRoot    = Get-Item $PSSCriptRoot
}

[hashtable]$Config = @{
    AutoOpenUrl  = $false
    AutoOpenCode = $false
}


# html header
$Template = @{}
$Template.HtmlHeader = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{0}</title>
</head>
    <style>
        table {
            border: 3px solid black
        }

        td {
            border: 2px solid blue;a
        }

        tr {
            border: 2px solid red;
        }
    </style>
<body>
'@

$Template.HtmlFooter = @'
</body>
</html>
'@



function _writeHtmlTable {
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        $InputObject
    )
    begin {
        # templates specific to this function may be declared in -begin
        $templateTable = @{}
        $templateTable.header = @'

    <table>
'@
        $templateTable.row = @'
        <tr>{0}</tr>
'@
        $templateTable.td = @'
        <td>{0}</td>
'@
        $templateTable.footer = @'
    </table>

'@

    }
    process {
        $Props = $InputObject.psobject.properties | Sort-Object Name
        $PropNames = $Props.Name | Sort-Object

        $templateTable.Header

        $splatTableRow = @{
            Separator    = '</td><td>'
            OutputPrefix = '<tr><td>'
            OutputSuffix = '</td></tr>'
        }
        $PropNames | Join-String @splatTableRow

        $PropNames | ForEach-Object {
            $InputObject.$_ | Join-String @splatTableRow
        }

        $templateTable.Footer

    }
}

$Config.AutoOpenCode = $true

function runExample {
    @(

        $Template.HtmlHeader -f @(
            $PSCommandPath | Split-Path -Leaf
            | Join-String -op 'Pwsh Html Example: '
        )

        Get-Date | _writeHtmlTable

        $Template.HtmlFooter
    )
    | Set-Content -Path $Paths.ExportHtml -Encoding utf8

    $Paths.ExportHtml | Join-String -op 'Wrote: ' -DoubleQuote

    if ($Config.AutoOpenUrl) {
        Start-Process -path (Get-Item $Paths.ExportHtml -ea stop) -WindowStyle Hidden
    }

    if ($Config.AutoOpenCode) {
        code.cmd --goto (Get-Item $Paths.ExportHtml -ea stop)
    }
}

runExample
