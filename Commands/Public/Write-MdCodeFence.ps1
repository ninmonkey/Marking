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
    end {
        @(
            $Ticks = $Character * 3 -join ''
            "`n"
            '{0}{1}' -f $Ticks, $Language
            $Text | Join-String -sep "`n" -op "`n" -os "`n"
            '{0}' -f $Ticks
            "`n"
        ) -join ''
    }
}
