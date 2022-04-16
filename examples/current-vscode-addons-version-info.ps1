$script:StrNull ??= "[`u{2400}]"

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
        # try {
        #     $this.VersionInstance = $this.Version
        # } catch {
        #     $This.VersionInstance = $script:StrNull
        # }

    }
}

class VSCodeExtensionsInfo {
    [VSCodeAppType_vs]$AppType = [VSCodeAppType_vs]::Unknown # maybe moved to collection as a whole
    [IO.FileInfo]$AppPath

}

$codeBin = Get-Command -CommandType Application -Name 'code.cmd' | Select-Object -First 1
$codeInsidersBin = Get-Command -CommandType Application -Name 'code-insiders.cmd' | Select-Object -First 1

$codeAddons = & $CodeBin @('--list-extensions', '--show-versions')
| Sort-Object -Unique | ForEach-Object {
    $setting = [ExtensionInfo_vs]::new($_)
    # $setting.AppType = 'Code'
    return $setting

    # if ($_ -match '(?<Name>)@(<?Version>[\d\.]+?)') {
    # [pscustomobject]@{

    #     Name    = $Matches.Name
    #     Version = $Matches.Version
    # }
}
$codeInsidersAddons = & $codeInsidersBin @('--list-extensions', '--show-versions')
| Sort-Object -Unique | ForEach-Object {
    $setting = [ExtensionInfo_vs]::new($_)
    # $setting.AppType = 'Insiders'
    return $setting

    # if ($_ -match '(?<Name>)@(<?Version>[\d\.]+?)') {
    # [pscustomobject]@{

    #     Name    = $Matches.Name
    #     Version = $Matches.Version
    # }
}

$codeAddons
$codeInsidersAddons
