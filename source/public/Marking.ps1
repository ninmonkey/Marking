#Requires -Version 7

function New-MarkdownHeader {
    <#
    .synopsis
        minimal wrapper to export code wrappped in markdown 
    #>
    [CmdletBinding()]
    param(
        # raw text
        [Alias('Text')]
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [string]$InputText,        

        # code fence language
        [Parameter()]
        [uint]$Depth = 2
        
    )
    begin {
        $Template = '{0} {1}'
    }
    end {        
        $Template -f @(
            ('#' * $Depth)
            $InputText
        )
    }
}
function New-MarkdownCodeFence {
    <#
    .synopsis
        minimal wrapper to export code wrappped in markdown 
    #>
    [CmdletBinding()]
    param(
        # raw text
        [Alias('Text')]
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [string[]]$InputText,

        # code fence language
        [Parameter()]
        [string]$Language
        
    )
    begin {
        $Template = @'
```{0}
{1}
```
'@
    }
    end {
        $codeChunk = $InputText -join "`n"
        $Template -f @(
            $Language ?? ''
            $codeChunk
        )
    }
}
function Write-Newline {
    param([int]$Count = 1)
    "`n" * $count
}
