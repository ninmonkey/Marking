<#
.Description
    Module built on: 2026-09-16 12:38:10Z
#>

#region Module.Before.ps1


#endregion Module.Before.ps1


#region Private Module Functions

function Escape-LinkUrl {
    <#
    .SYNOPSIS
        Escape markdown Url components
    .description
        - encode spaces as %20
        - (nyi) escape unicode runes? check the specs.
    #>
    [CmdletBinding()]
    param(
        # Header text
        [Parameter(ValueFromPipeline)]
        [Alias('InputObject', 'Content')]
        [string] $Text
    )
    begin {
    }
    process {
        $Text -replace '[ ]', '%20'
    }
    end {

    }
}


#endregion Private Module Functions


#region Public Functions

function Write-MdBold {
    <#
    .SYNOPSIS
        Writes Md Bold / strong text, like <strong>
    .example
        'file list:' | Write-MdBold
        # **file list:**
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Header text
        [Parameter(ValueFromPipeline)]
        [string] $Text
    )
    process {
        '**{0}**' -f $Text
    }
}

function Write-MdCodeFence {
    <#
    .SYNOPSIS
        Writes Md CodeFence
    .example
        Write-MdCodeFence $Code
        $code | Write-MdCodeFence
        $code | Write-MdCodeFence -Language 'json'
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Code to wrap
        [Alias('Content')]
        [Parameter(ValueFromPipeline)]
        [string[]] $Text,

        # Language: c, js, py, etc. ( default: none )
        [ArgumentCompletions('js', 'json', 'md', 'yml', 'ts', 'log', 'html', 'css', 'PowerShell')]
        [string] $Language = '',

        # Which character to use? ( Default: "---" )
        [ValidateSet('`', '~')]
        [string] $Character = '`'
    )
    begin {
        $Ticks = $Character * 3 -join ''
        $Prefix = '{0}{1}' -f $Ticks, $Language
        $Suffix = '{0}' -f $Ticks
        [Collections.Generic.List[object]] $Content = @()
    }
    process {
        foreach( $Line in $Text ) {
            $Content.Add( $Line )
        }
    }
    end {
        @(
            "`n"
            $Prefix
            $Content | Join-String -sep "`n" -op "`n" -os "`n"
            $Suffix
            "`n"
        ) -join ''
    }
}

function Write-MdCodeSpan {
    <#
    .SYNOPSIS
        Writes Md Code Span, like <code>
    .example
        'x = 0xff' | Write-MdCodeSpan
        # <code>x = 0xff</code>
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Code to wrap
        [Parameter(ValueFromPipeline)]
        [string] $Text
    )
    process {
        '`{0}`' -f $Text
    }
}

function Write-MdHeader {
    <#
    .SYNOPSIS
        Writes Md headers, like <h1>, <h2>, etc.
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Header text
        [string] $Text,

        # Header depth. The number of '#'. ( Default: 1 )
        [ArgumentCompletions(1, 2, 3, 4, 5, 6)]
        [Alias('Depth')]
        [int] $Level = 1
    )
    end {
        $prefix = '#' * $Level -join ''
        "${Prefix} ${Text}"
    }
}

function Write-MdHorizontalRule {
    <#
    .SYNOPSIS
        Writes Md Horizontal Rule like <hr>
    .example
        Write-MdHorizontalRule
        # ----
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Which character to use? ( Default: "---" )
        [ValidateSet('-', '*', '_')]
        [string] $Character = '-'
    )
    process {
        $Render = $Character * 3 -join ''
        "`n${Render}`n"
    }
}

function Write-MdItalic {
    <#
    .SYNOPSIS
        Writes Italic text
    .example
        'foo bar' | Write-MdItalic
        # *foo bar*
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Header text
        [Parameter(ValueFromPipeline)]
        [string] $Text
    )
    process {
        '*{0}*' -f $Text
    }
}

function Write-MdLink {
    <#
    .SYNOPSIS
        Writes Md Links / Urls, like [Title](Url)
    .example
        Write-MdLink -Title 'Back to TOC' -Url '#toc'
        # out: [Back to TOC](#toc)
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Header text ( optional )
        [Alias('Name')]
        [object] $Title,

        # Url to link to.
        # Currently accepts any Url because sometimes you want invalid urls
        [ArgumentCompletions(
            "'#top'",
            "'file:///c/some%20file.md'",
            "'file.md'"
        )]
        [Parameter(Mandatory)]
        [Alias('Link', 'Uri')]
        [string] $Url
    )
    end {
        # If title is missing, write <autolink.html> format
        if( [string]::IsNullOrWhitespace( $Title )  ) {
            return "<${Url}>"
        }

        $Url = $Url | Escape-LinkUrl
        return '[{0}]({1})' -f $Title, $Url
    }
}

# https://spec.commonmark.org/0.31.2/#link-reference-definitions

function Write-MdList {
    <#
    .SYNOPSIS
        Writes Md lists, - item 1
    .example
        # show files
        gci . -name | Write-MdList

        # output:
            # - readme.md
            # - Marking.psd1
    #>
    [OutputType( [string] )]
    [CmdletBinding()]
    param(
        # Header text
        [Parameter(ValueFromPipeline)]
        [Alias('InputObject', 'Content')]
        [object[]] $Text
    )
    begin {
        [Text.StringBuilder] $sb  = ''
        $ListIcon = '-'
    }
    process {
        foreach( $Item in $Text ) {
            [void] $sb.AppendFormat("{0} {1}`n", $ListIcon, $Item)
        }
    }
    end {
        return $sb.ToString()
    }
}


#endregion Public Functions


#region Module.After.ps1


#endregion Module.After.ps1

