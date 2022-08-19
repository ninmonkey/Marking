$Config = @{
    AlwaysOpenCode = $False
}
$Templates = @{
    Newline = '<br/>'
    H1      = '<h1>{0}</h1>'
}
$Templates.FullPage = @'
<html><head><title>dynamic generate tables</title>
<link rel="stylesheet" href="../normalize.css">
<body>
{0}
</body></head>
'@
$Templates.FullPageKeys = @'
<html><head><title>dynamic generate tables</title>
{{style}}
</head>
<body>
{{content}}
</body></head>
'@





function New-HtmlTable_nestedNaive {
    <#
    .synopsis
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        $InputObject
    )

    begin {
        # for templates only used by this function
        $Templates = @{
            'TableRootBegin' = '<table>'
            'TableRootEnd'   = '</table>'
        }

        # here strings simplify more complicated templates
        $Templates.TableRow = @'
<tr>{0}</tr>
'@

        $Templates.TableHeaderCell = @'
<th>{0}</th>
'@
        $Templates.TableCell = @'
<td>{0}</td>
'@
    }
    process {


        $props = $InputObject.psobject.Properties
        | Sort-Object Name

        $Templates.TableRootBegin

        # new-segment
        if ($true) {
            $cells = $props.Name | ForEach-Object {
                $Templates.TableHeaderCell -f @( $_ )
            }
            $Templates.TableRow -f @($cells -join '')
        }

        # new-segment
        if ($true) {
            $cells = $props.Value | ForEach-Object {
                $Templates.TableCell -f @( $_ )
            }
            $Templates.TableRow -f @($cells -join '')
        }





        $Templates.TableRootEnd
        return

        # 0..2 | ForEach-Object {
        #     'a', 'b', 'c' | ForEach-Object {
        #         $Templates.TableCell -f $_
        #     }
        # }
        @(

            $Templates.TableRow -f $cells
        )
        $Templates.TableFoot
    }
    end {
    }
}


$Paths = @{
    Ex1 = Join-Path (Join-Path $PSScriptRoot '.output') 'html1.html'
    # Ex1 = 'temp:\html.html'
}




$dynamicTable = @(
    Get-Date | New-HtmlTable_nestedNaive
) -join ''

$Templates.FullPage -f @( $dynamicTable )
| sc -path $Paths.Ex1

'wrote: ', @( Get-Item $Paths.Ex1 | ForEach-Object Fullname)

if ($Config.AlwaysOpenCode) {
    Get-Item -Path $Paths.Ex1
    | ForEach-Object { code.cmd --goto $_ }

}
