

function Write-MarkingHtmlElement {
    <#
   .synopsis
        Write an HTML element
    .example
        > Mark.Write-HtmlElement -Tag 'a' -InnerText 'about' -Attributes @{ class = 'nav.bold' }
            <a class="nav.bold">about</a>

        > Mark.Write-HtmlElement -Tag 'hr'
            <hr>
    .example
        > Mark.Write-HtmlElement -Tag 'foobar' -VoidElement
            <foobar>
    #>
    [Alias( 'Mark.Write-HtmlElement' )]
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Html/Svg element name
        [Parameter(Mandatory)]
            [Alias('TagName')]
            [ArgumentCompletions('a', 'div', 'p', 'ul', 'li', 'section', 'nav', 'html', 'body')]
            [string] $ElementName,

        # element Attributes
        [Parameter()]
            [hashtable] $Attributes = @{},

        # Child Nodes
        [Parameter()]
            [Alias('Content', 'Body', 'ElementContents')]
            [ValidateScript({throw 'param: nyi'})]
            [object[]] $ChildNodes,

        # Instead of ChildNodes, use raw strings instead
        # Or merge as one parameter?
        [Parameter()]
            [string[]] $InnerText,

        # is an HTML void element, ie: <hr>
        [Parameter()]
            [switch] $VoidElement
    )
    begin {
        $sb      = [Text.StringBuilder]::new()
        $attr_sb = [Text.StringBuilder]::new()

        [bool] $isVoidElement = $VoidElement -or ( _Test-HtmlElementIsVoidElement -TagName $ElementName )
        if(
            $IsVoidElement -and (
                $PSBoundParameters.ContainsKey('ChildNodes') -or $PSBoundParameters.ContainsKey('InnerText')
            )
        ) {
            Write-Error "Void element '<${ElementName}>' was passed ChildNodes/InnerText"
        }
    }
    end {
        # no longer: if( $attr_sb.Length -gt 0 ) { $attr_sb.Insert( 0, ' ' ) }
        $Attributes.GetEnumerator() | %{
            $null = $attr_sb.AppendFormat( ' {0}="{1}"', $_.Key, $_.Value )
        }

        if( $isVoidElement ) {
            $null = $sb.AppendFormat(
                '<{0}{1}>',
                $ElementName, $attr_sb.ToString(), ($innerText -join "`n")
            )
        } else {
            $null = $sb.AppendFormat(
                '<{0}{1}>{2}</{0}>',
                $ElementName, $attr_sb.ToString(), ($innerText -join "`n")
            )
        }
        # ex: <a href="url" class="nav">name</a>
        return $sb.ToString()
    }
}
