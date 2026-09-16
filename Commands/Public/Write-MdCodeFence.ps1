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
