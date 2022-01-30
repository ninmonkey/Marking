[hashtable]$strConst ??= @{
    Backtick       = "`u{60}"
    CodeFenceTicks = "`u{60}" * 3 -join ''
}
# [string]$script:_md_state.curFile = $null
[hashtable]$script:_md_state ??= @{
    curFile          = $Null
    exportPathPrefix = '.output'
    codeFenceIsOpen  = $false # write/throw errors when a fence is still open
}
function _set_Config {
    <#
    .synopsis
        (internal only). abstracts inner cache state
    .description
        hashtable of values.

        maybe copy cache logic from my gist: <https://gist.github.com/ninmonkey/da05dcd8271cef5c59eb76e2563d4a0e>

        To get/set a filepath, see functions that include error handling.

            Set-MdCurOutputPath()
            Get-MdCurOutputPath()
    #>
    [CmdletBinding(PositionalBinding = $false)]
    param(
        # Key
        [Parameter(Mandatory, Position = 0)]
        [String]$Key,

        # Value
        [Parameter(Mandatory, Position = 1)]
        [String]$Value
    )
    Write-Verbose "_set_Config: '$Key' = '$Value'"
    $script:_md_state[$Key] = $Value
}

function _get_Config {
    <#
    .synopsis
        (internal only). abstracts inner cache state
    .notes
        maybe copy cache logic from my gist: <https://gist.github.com/ninmonkey/da05dcd8271cef5c59eb76e2563d4a0e>
    .outputs
        type: anyvalue
    #>
    [CmdletBinding(DefaultParameterSetName = 'ReadValue')]
    param(
        # Key name
        [Parameter(
            Mandatory, Position = 0,
            ParameterSetName = 'ReadValue'
        )]
        [string]$Key,

        # throw errors on missing values?
        [Parameter(ParameterSetName = 'ReadValue')]
        [switch]$Strict,

        # List values
        [Alias('List')]
        [Parameter(ParameterSetName = 'ReturnAll')]
        [switch]$PassThru
    )
    Write-Verbose "_get_Config: '$Key'"
    if ($PassThru) {
        $script:_md_state
        return
    }
    if ($script:_md_state.ContainsKey( $Key ) ) {
        $script:_md_state[$key]
        return
    }
    if ($Strict) {
        Write-Error "_get_Config: Key does not exist: '$Key'"
    }
}

function Set-MdCurOutputPath {
    <#
    .synopsis
        filepath to implicitly write to, and truncates/clears file's contents
    .notes
        clears codeFenceIsOpen state

    #>
    param(
        # filepath
        [Parameter(mandatory, position = 0)]
        [string]$Path,

        # Clear/Delete file, otherwise keep appending it
        [Parameter()]
        [switch]$ClearFile
    )
    if ( [string]::IsNullOrWhiteSpace( $Path ) ) {
        throw "BadPath: Empty, Null, or Whitespace '$Path'"
    }
    throw 'Track setting here, some how '
    $ActualPath = Join-Path (_get_Config 'exportPathPrefix') -AdditionalChildPath $Path
    _set_Config ' ' -Value $ActualPath
    _set_Config 'codeFenceIsOpen' -Value $false
    @{
        ActualPath       = $ActualPath
        ExportPathPrefix = (_get_Config 'exportPathPrefix')
    } | Format-HashTable | Write-Debug

    if ($ResetFile) {
        Write-Debug "Deleting File '$ActualPath'"
        Set-Content -Path $ActualPath -Value '' -NoNewline -Confirm
    }
}
function Get-MdCurOutputPath {
    <#
    .synopsis
        path implicitly used as file output

    #>
    [CmdletBinding()]
    param(
        # Allow not yet existing files
        [Parameter()]
        [switch]$AllowNotExisting
    )
    $Path = _get_Config 'curFile'
    # $Path = $script:_md_state.curFile
    if (Test-Path $Path) {
        $Path | Get-Item -ErrorAction Continue
        return
    }
    if ($AllowNotExisting) {
        $Path
        return
    }

    Write-Error "Path does not exist: '$Path'"
}
function Write-MdStartCodeBlock {
    <#
    .synopsis
        starts a MD codefence, optionally with a language
    #>
    [alias('codeBlock')]
    param(
        # lang
        [Parameter(position = 0)]
        [string]$Language = '',
        # Path
        [Parameter(position = 1)]
        [String]$Path
    )

    if (_get_Config 'codeFenceIsOpen') {
        Write-Error 'Write-MdStartCodeBlock: CodeFence is still open!'
        return
    }
    _set_Config 'codeFenceIsOpen' $true
    $Path = Get-MdCurOutputPath

    $template = "`n{0}{1}`n" -f @(
        $strConst.CodeFenceTicks
        $Language
    )
    $template
}
function Write-MdEndCodeBlock {
    [alias('codeBlockEnd')]
    param()
    Write-MdStartCodeBlock -Language ''
    # $template = $strConst.CodeFenceTicks
    # $template
}
