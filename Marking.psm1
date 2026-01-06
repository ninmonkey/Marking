[Text.StringBuilder] $script:__SbDefault = ''

function _StringBuilder.Append {
     <#
    .SYNOPSIS
        [internal] Append [StringBuilder] reference else shared. Outputs nothing.
    .DESCRIPTION
        No output. Writes to the explicit, else fallback string builder.
    #>
    [Alias('_Sb.Append')]
    [CmdletBinding()]
    [OutputType( [Void] )]
    param(
        # objects to append to string
        [Parameter(ValueFromPipeline)]
            [object[]] $InputObject,

        # Write output to StringBuilder else the module fallback StringBuilder
        [Parameter(Position = 0)]
            [Alias('Sb', 'StringBuilder')]
            [Text.StringBuilder] $StrBuilder = $Null,

        # When input is an array, join on this string
        [Alias('Delimiter')]
            [String] $Separator = ''
    )
    end {
        $items = @( $InputObject )
        $strB  = $StrBuilder ?? $script:__SbDefault
        $null  = $strB.AppendJoin( $Separator, $items )
        $null  = $strB.AppendLine()
    }
}

function _StringBuilder.Clear {
     <#
    .SYNOPSIS
        [internal] Clears [StringBuilder] reference else shared fallback StringBuilder. Outputs nothing.
    .DESCRIPTION
        No output. Writes to the explicit, else fallback string builder.
    #>
    [Alias('_Sb.Clear')]
    [CmdletBinding()]
    [OutputType( [Void] )]
    param(
        # Write output to StringBuilder else the module fallback StringBuilder
        [Parameter(Position = 0)]
            [Alias('Sb', 'StringBuilder')]
            [Text.StringBuilder] $StrBuilder = $Null
    )
    end {
        $strB = $StrBuilder ?? $script:__SbDefault
        $null = $strB.clear()
    }
}

function _StringBuilder.ToString {
     <#
    .SYNOPSIS
        [internal] Outputs the [StringBuilder] as a string
    .notes
        never throws or errors, when using null values
    #>
    [Alias('_Sb.ToString')]
    [CmdletBinding()]
    [OutputType( [string] )]
    param(
        # Read from StringBuilder else the module fallback StringBuilder
        [Parameter(Position = 0)]
            [Alias('Sb', 'StringBuilder')]
            [Text.StringBuilder] $StrBuilder = $Null
    )
    end {
        $strB = $StrBuilder ?? $script:__SbDefault
        ( $strB )?.ToString() ?? ''
    }
}

function _Test-HtmlElementIsVoidElement {
    <#
    .SYNOPSIS
        Is element a known HTML void element, like <img>, <hr>, <br>, etc...
    #>
    [OutputType( [bool] )]
    param(
        [Alias('TagName')]
        [string] $ElementName
    )
    $regex_IsKnownVoidElement =
        @('area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'link', 'meta', 'source', 'track', 'wbr')
            | Mint.New-RegexOr -FullMatch -EscapeRegex

    $ElementName -match $regex_IsKnownVoidElement
}



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

function Write-MarkingMdCodeBlock {
     <#
    .SYNOPSIS
        Markdown: CodeBlock with language
    .link
        System.Text.StringBuilder
    #>
    [Alias(
        'Mark.Md.Write-CodeBlock',
        'Mark.Md.Fence',
        'Mark.Md.CodeBlock'
    )]
    [OutputType( [string] )]
    param(
        [Parameter(Position = 0)]
        [ArgumentCompletions( 'cs', 'css', 'csv', 'html', 'js', 'md', 'ps1', 'ts', 'xml' )]
        [string] $LanguageName = '',

        [Alias('InputObject')]
        [Parameter(ValueFromPipeline)]
        [string[]] $TextContent,

        [Parameter()]
        [Alias('Sb', 'StringBuilder')]
        [Text.StringBuilder] $StrBuilder = $Null
    )
    begin {
        [Text.StringBuilder] $fence  = ''
        if( $null -ne $StrBuilder ) { $fence = $StrBuilder }

        $triple = '```'
        $null = $fence.Append("${triple}${LanguageName}`n" )

        [bool] $IsUsingStrBuilderRef = $PSBoundParameters.ContainsKey( 'StrBuilder' )
    }
    process {
        foreach($line in $TextContent ) {
            $null = $fence.Append( "${line}`n" )
        }
    }
    end {
        $null = $fence.Append( "${triple}`n" )

        # if no StrBuilder was passed, output the string. otherwise silent.
        if( -not $IsUsingStrBuilderRef ) {
            $fence.ToString()
        }
    }
}

function Write-MarkingMdHeader {
     <#
    .SYNOPSIS
        Markdown: Header levels
    .link
        System.Text.StringBuilder
    #>
    [Alias(
        'Mark.Md.Write-Header',
        'Mark.Md.Header'
    )]
    [OutputType( [string] )]
    param(
        [Parameter(Mandatory)]
            [Alias('Content', 'Title')]
            [string] $Name,

        [Alias('Depth')]
            [ArgumentCompletions(1, 2, 3, 4, 5, 6)]
            [Int] $Level = 1,

        # Write output to StringBuilder else the module fallback StringBuilder
        [Parameter()]
            [Alias('Sb', 'StringBuilder')]
            [Text.StringBuilder] $StrBuilder = $Null
    )
    begin {
        [bool] $IsUsingStrBuilderRef = $PSBoundParameters.ContainsKey( 'StrBuilder' )
        [Text.StringBuilder] $strB  = ''
        if( $null -ne $StrBuilder ) { $strB = $StrBuilder }

        $blocks = '#' * $Level -join ''
        $null = $strB.Append( "${blocks} ${Name}`n" )

        if( -not $IsUsingStrBuilderRef ) {
            $strB.ToString()
        }

    }
    process {

    }
}

