$Config = @{
    AlwaysOpenCode = $False
}
$Templates = @{
    Newline = '<br/>'
    H1      = '<h1>{0}</h1>'

}


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
            'TableHead'   = '<table>'
            'TableFooter' = '</table>'
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

        $Templates.TableHead

        $cells = $props.Name | ForEach-Object {
            $Templates.TableHeaderCell -f @( $_ )
        }
        $Templates.TableRow -f @($cells -join '')



        $Templates.Footer



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
    Ex1 = 'temp:\html.html'
}

Get-Date | New-HtmlTable_nestedNaive
| sc -path $Paths.Ex1

'wrote: ', @( Get-Item $Paths.Ex1 | ForEach-Object Fullname)

if ($Config.AlwaysOpenCode) {
    Get-Item -Path $Paths.Ex1
    | ForEach-Object { code.cmd --goto $_ }

}
