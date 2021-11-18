#Requires -Version 7
#Requires -Module NameIt
Import-Module NameIt

$SampleSrc = @'
function convertFrom-ExampleNumber {
    <#
    .synopsis
        sample convertTo NameIt template
    #>
    param(
        # InputObject
        [Parameter(position = 0, ValueFromPipeline)]
        [object]$InputObject
    )
    process {
        $InputObject
    }
}
'@


function New-VSCodeSnippet {
    <#
    .synopsis
        helps with most wrapping; quick hack, not best practices
    #>
    [CmdletBinding(PositionalBinding = $false)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string[]]$Text
    )
    
    begin {
        $lines = [list[string]]::new()
    }
    process {
        $Name | ForEach-Object {
            $lines.Add( $_ )
        }
    }
    end {
        $strAccum = [System.Text.StringBuilder]::new()
        $strAutotranslate = [System.Text.StringBuilder]::new()
        h1 'original'
        $Lines | str str ''

        #optional mappings. order matters.
        $lines | ForEach-Object { 
            $curLine = $_
            $str = $curLine -replace '"', ''
            
            $strAccum.Append( $str )
            $strAutotranslate.Append( ($curLine | ConvertTo-Json ) ?? $null )
        }

        h1 'accum'
        $strAccum | str nl 22 
        h1 'auto'
        $strAutotranslate | str nl 22 
    }
}

New-VSCodeSnippet ($SampleSrc -join '')
hr 

