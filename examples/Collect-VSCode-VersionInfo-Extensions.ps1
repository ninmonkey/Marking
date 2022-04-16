using namespace system.collections.generic
$script:StrNull ??= "[`u{2400}]"

$readmeMd = @'
See more:

- [vsce](https://code.visualstudio.com/api/working-with-extensions/publishing-extension#vsce)
- <https://code.visualstudio.com/api/working-with-extensions/continuous-integration>

'@

enum IsEnabled_vs {
    Disabled = 0
    Enabled = 1
    Unknown
}

enum VSCodeAppType_vs {
    Code = 1
    Insiders = 2
    CodeInsiders = 2
    Unknown = 3
    # Code_Insiders = 2
}

class ExtensionInfo_vs {

    <#
    .synopsis
        A Single Extension Record
    #>
    [string]$Name
    [string]$Version  #
    [IsEnabled_vs]$Enabled = [IsEnabled_vs]::Unknown  #NYI until I can detect which are running


    # no: [object]$VersionInstance # type: Union( optional[version], [string] )
    # [object]$VersionInstance # type: Union( [version?], [string] )

    # ExtensionInfo_vs()  {}
    ExtensionInfo_vs(
        [String]$RawString
    ) {
        $this.Name, $this.Version = $RawString -split '@'
    }
}

Write-Warning @'
next todo:
    - [ ] coerce strings 'code.cmd' and 'code-insiders.cmd' to [VSCodeAppType_vs]
    - [ ] [VSCodeExtensionsInfo] ctor to
'@


class VSCodeExtensionsInfo {
    <#
    .synopsis
        represents one instance of vscode-[insiders].cmd and installed extensions
    .example
        PS> $code_info = [VSCodeExtensionsInfo]::new('code')
            $code_info | select *
        PS> $code_info = [VSCodeExtensionsInfo]::new('code.cmd')
        PS> $ivy_info = [VSCodeExtensionsInfo]::new('code-insiders.cmd')
    .notes
    future:
        - [ ] manual switch required unless enum coercion to 'code.cmd' works
        - [ ] export function
    #>

    # code or insiders?
    [VSCodeAppType_vs]$AppType = [VSCodeAppType_vs]::Unknown

    # FulLName to bin
    [IO.FileInfo]$AppPath

    # enumerate extensions
    [list[ExtensionInfo_vs]]$Extensions = [list[ExtensionInfo_vs]]::new()

    VSCodeExtensionsInfo(
        [String]$Command # name and/or path. code.cmd is valid
    ) {
        $binCmd = Get-Command -CommandType Application -Name $Command | Select-Object -First 1
        $this.AppPath = $binCmd | Get-Item -ea stop

        # until I get coerceion added to an enum
        $this.AppType = if ($binCmd.Name -match 'insiders') {
            [VSCodeAppType_vs]::Insiders
        } else {
            [VSCodeAppType_vs]::Code
        }

        $binArgs = ('--list-extensions', '--show-versions')
        $this.Extensions = & $binCmd @binArgs
        | Sort-Object -Unique | ForEach-Object {
            $setting = [ExtensionInfo_vs]::new($_)
            # $setting.AppType = 'Code'
            return $setting
        }
    }
}

function Invoke-CollectExtensionInfo {
    New-Alias 'to->Json' -Value 'ConvertTo-Json'

    $code_info = [VSCodeExtensionsInfo]::new('code.cmd')
    $vivy_info = [VSCodeExtensionsInfo]::new('code-insiders.cmd')
    $RootExport = Get-Item -ea stop (Join-Path $PSScriptRoot '.output')
    $code_info | to->Json -EnumsAsStrings | Sc (Join-Path $RootExport 'vs-code-extensions.json')
    $vivy_info | to->Json -EnumsAsStrings | Sc (Join-Path $RootExport 'vs-code-insiders-extensions.json')

    # Get-ChildItem $RootExport *.json

    @(
        Get-Item (Join-Path $RootExport 'vs-code-extensions.json')
        Get-Item (Join-Path $RootExport 'vs-code-insiders-extensions.json')
    ) | Join-String -sep "`n -" -op "Wrote files: ... `n -"

    'unknown stuff'
    & $code_info.AppPath @('--status')
    | sc (Join-Path $RootExport 'vs-code-status.txt')

    & $vivy_info.AppPath @('--status')
    | sc (Join-Path $RootExport 'vs-code-insiders-status.txt')
}

Invoke-CollectExtensionInfo


if ($False) {
    # old, manual invocation method

    $codeBin = Get-Command -CommandType Application -Name 'code.cmd' | Select-Object -First 1
    $codeInsidersBin = Get-Command -CommandType Application -Name 'code-insiders.cmd' | Select-Object -First 1

    $codeAddons = & $CodeBin @('--list-extensions', '--show-versions')
    | Sort-Object -Unique | ForEach-Object {
        $setting = [ExtensionInfo_vs]::new($_)
        return $setting
    }
    $codeInsidersAddons = & $codeInsidersBin @('--list-extensions', '--show-versions')
    | Sort-Object -Unique | ForEach-Object {
        $setting = [ExtensionInfo_vs]::new($_)
        return $setting
    }
    $RootExport = Get-Item -ea stop (Join-Path $PSScriptRoot '.output')
    $codeAddons | to->Json -EnumsAsStrings | Sc (Join-Path $RootExport 'vs-code-extensions.json')
    $codeInsidersAddons | to->Json -EnumsAsStrings | Sc (Join-Path $RootExport 'vs-code-insiders-extensions.json')
    Get-ChildItem $RootExport *.json
}
