

function Write-MarkingHtmlElement {
    <#
   .synopsis
        Write an HTML element
    .example
    #>
    [Alias( 'Mark.Write-HtmlElement' )]
    [OutputType(
        [string] # when: !PassThru
    )]
    [CmdletBinding()]
    param(
        # Html/Svg element name
        [Parameter(Mandatory)]
            [Alias('TagName')]
            [ArgumentCompletions('a', 'div', 'p', 'ul', 'li', 'section', 'nav', 'html', 'body')]
            [string] $ElementName,

        # Attributes
        [Parameter()]
            [ValidateScript({throw 'param: nyi'})]
            [hashtable] $Attributes,

        # Child Nodes
        [Parameter()]
            [Alias('Content', 'Body', 'ElementContents')]
            [ValidateScript({throw 'param: nyi'})]
            [object[]] $ChildNodes,

        # Instead of ChildNodes, use raw strings instead
        # Or merge as one parameter?
        [Parameter()]
            [string[]] $InnerText
    )
    begin {
        $sb = [Text.StringBuilder]::new()
        $attr_sb = [Text.StringBuilder]::new()
    }
    end {
        # pad if missing
        if( $attr_sb.Length -gt 0 ) { $attr_sb.Insert( 0, ' ' ) }

        # ex: <a href="url">name</a>
        $null = $sb.AppendFormat(
            '<{0}{1}>{2}</{0}>',
            $ElementName, $attr_sb.ToString(), ($innerText -join "`n")
        )

        return $sb.ToString()
    }
}
