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
