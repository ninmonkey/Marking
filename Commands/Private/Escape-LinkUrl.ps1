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
