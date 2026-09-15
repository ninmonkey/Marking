#requires -PSEdition Core
#requires -Modules pansies
<#
.SYNOPSIS
    Builds the current repo's module including FormatData
.Description

## Uses standard names across repos:

    - Build.Module.ps1 - Assemble module
    - Build.ezout.ps1 - Build FormatData
    - Module.Before.ps1 - Module content before function bodies
    - Module.After.ps1 - Module content after the function bodies

## Module.psm1's contents are generated in this order:

    Module.Before.ps1

    All /Private/* functions
    All /Public/* functions

    Module.After.ps1
.EXAMPLE
    # If you want to inspect the summary, dot source it
    . .\Build\Build.Module.ps1; $commands_summary ;

.Example
    # Show summaries of functions assembled:

    . .\Build\Build.Module.ps1; $commands_summary ;
    $commands_private | ft
    $commands_public  | ft
    $commands_summary | ft
.LINK
    Module.Before.ps1
.LINK
    Module.After.ps1
.LINK
    Module.OnExit.ps1
#>
#region Init
$myFile       = $MyInvocation.MyCommand.ScriptBlock.File
$script:MyModuleName = 'Marking'
$myRoot       = $myFile | Split-Path
$BuildConfig = @{
    LineEnding = "`r`n"
}

$myRoot | write-Verbose
$cdStackName = "${myModuleName}.build"
Push-Location -Stack $cdStackName $myRoot

$Regex = [ordered]@{}
# these names are excluded from any files in /Public and /Private
$Regex.SpecialModuleIgnores = '^(Module\.Before|Module\.After|Module\.OnExit)\.ps1$'

#endRegion Init

#region Internal Function Definitions
function writeRegion {
    <#
    .SYNOPSIS
        (internal function) Writes "#region foo", "#endregion foo" blocks with whitespace padding
    .example
        > writeRegion 'Body'
            '#region Body'

        > writeRegion 'Body' -End
            '#endregion Body'
    #>
    param(
        [Alias('Name')][Parameter(Mandatory)]
        [string] $RegionName,
        [Switch] $EndRegion,

        # Do not pad, exclude newlines
        [Alias('NoWhitespace')]
        [Switch] $Compress
    )
    $Pad = $Compress ? '' : "`n"
    if( $EndRegion ) {
        "${Pad}#endregion ${RegionName}${Pad}"
    } else {
        "${Pad}#region ${RegionName}${Pad}"
    }
}
#endregion Internal Function Definitions

#region Collect Functions
$commands_public   = @( # commands that are exported to the user
    # to recurse or not ?
    @( foreach ( $potentialDirectory in 'Commands/Public' ) {
        Get-ChildItem -Recurse -ea ignore -Path ( Join-Path $myRoot $potentialDirectory )
    })
    | ? Name -NotMatch $Regex.SpecialModuleIgnores
    | ? Extension -in '.ps1'
)
$commands_private   = @( # internal commands that are not exported
    # to recurse or not ?
    @( foreach ( $potentialDirectory in 'Commands/Private') {
        Get-ChildItem -Recurse -ea ignore -Path ( Join-Path $myRoot $potentialDirectory )
    })
    | ? Name -NotMatch $Regex.SpecialModuleIgnores
    | ? Extension -in '.ps1'
)

[Collections.Generic.List[object]] $commands_summary = @()
$commands_summary.AddRange(
    @(
        $commands_public
        | %{
            $item = $_
            [pscustomobject]@{
                PSTypeName    = 'build.getserve.command.public'
                Public        = $true
                Name          = $Item.Name
                Size          = '{0:n2} kb' -f ( $Item.Length / 1kb )
                LastWriteTime = $Item.LastWriteTime
                Verb          = @( $Item.BaseName -split '-', 2 )[0]
                # Path          = $Item
                FullName      = $Item                                  # convert to alias
                # Documentation = ''
                # HasRequiresStatement       = $false
                # HasUsingNamespaceStatement = $false
            }
        }
        | Sort-Object Verb, Name
    )
)
$commands_summary.AddRange(
    @(
        $commands_private
        | %{
            $item = $_
            [pscustomobject]@{
                PSTypeName    = 'build.getserve.command.private'
                Public        = $False
                Name          = $Item.Name
                Size          = '{0:n2} kb' -f ( $Item.Length / 1kb )
                LastWriteTime = $Item.LastWriteTime
                Verb          = @( $Item.BaseName -split '-', 2 )[0]
                # Path          = $Item
                FullName      = $Item                                  # convert to alias
                # Documentation = ''
                # HasRequiresStatement       = $false
                # HasUsingNamespaceStatement = $false
            }
        }
        | Sort-Object Verb, Name
    )
)

$destinationRoot = $myRoot

$commands_summary
    | Join-String -f "`n {0}" -op 'Commands' -p {
        [System.IO.Path]::GetRelativePath( $myRoot, $_.FullName )
    }
    | Write-Host -fg 'magenta'
Pop-Location -Stack $cdStackName

#endregion Collect Functions

#region Write Source to Files
if( $commands_summary.count -gt 0 ) {
    $myModuleFile = Join-Path $DestinationRoot "${myModuleName}.psm1"
    <#
        Write module source code:
            special files:
                Module.Before.ps1, Module.End.ps1

    The output Module.psm1's contents are generated in this order:

        1] Module.Before.ps1
        2] All /Private/* functions
        3] All /Public/* functions
        4] Module.After.ps1
    #>
    @(
        @"
<#
.Description
    Module built on: $( ( get-date ).tostring('u') )
#>
"@
        writeRegion -RegionName 'Module.Before.ps1'
        $ModuleBeginDefinition = Get-Item -ea 'silentlyContinue' ( Join-Path $myRoot 'Commands/Module.Before.ps1' )
        if( $ModuleBeginDefinition ) {
            ( Get-Content -raw $ModuleBeginDefinition ) -replace '\r?\n', $BuildConfig.LineEnding
        } else {
            'optional "Commands/Module.Before.ps1" was not found' | Write-Verbose -verbose
        }
        writeRegion -RegionName 'Module.Before.ps1' -EndRegion

        writeRegion -RegionName 'Private Module Functions'
        foreach ( $item in ( $commands_summary | ? -Not Public ) )  {
            ( Get-Content -raw (Get-Item $item.FullName ) ) -replace '\r?\n', $BuildConfig.LineEnding
        }
        writeRegion -RegionName 'Private Module Functions' -EndRegion

        writeRegion -RegionName 'Public Functions'
        foreach ( $item in ( $commands_summary | ? Public ) )  {
            ( Get-Content -raw (Get-Item $item.FullName ) ) -replace '\r?\n', $BuildConfig.LineEnding
        }
        writeRegion -RegionName 'Public Functions' -EndRegion

        writeRegion -RegionName 'Module.After.ps1'
        $ModuleEndDefinition = Get-Item -ea 'silentlyContinue' ( Join-Path $myRoot 'Commands/Module.After.ps1' )
        if( $ModuleEndDefinition ) {
            ( Get-Content -raw $ModuleEndDefinition ) -replace '\r?\n', $BuildConfig.LineEnding
        } else {
            'optional "Commands/Module.After.ps1" was not found' | Write-Verbose -verbose
        }
        writeRegion -RegionName 'Module.After.ps1' -EndRegion
    )
    | Join-String -sep $BuildConfig.LineEnding
    | Set-Content -Path $MyModuleFile -encoding UTF8 -ProgressAction Continue # -Confirm
}
#endregion Write Source to Files

"*.psm1 build complete!`a" | Write-Host -fg 'green'

#region Write Format Files
if( $true )  {
    Write-Verbose 'Build FormatData and TypeData?: Skipped...'
    return
}
if ($commands_public) {
    $myFormatFile = Join-Path $destinationRoot "$myModuleName.format.ps1xml"
    $commands_public
        | Out-FormatData -Module $MyModuleName
        | Set-Content $myFormatFile -Encoding UTF8 -Verbose -ProgressAction Continue # -Confirm
    Get-Item $myFormatFile
}

$types = @(
    # Add your own Write-TypeView statements here
    # or declare them in the 'Types' directory
    Join-Path $myRoot Types
        | Get-Item -ea ignore
        | Import-TypeView

)

if ($types) {
    $myTypesFile = Join-Path $destinationRoot "$myModuleName.types.ps1xml"
    $types
        | Out-TypeData
        | Set-Content $myTypesFile -Encoding UTF8 -Verbose -ProgressAction Continue # -Confirm

    Get-Item $myTypesFile
}
#endregion Write Format Files
Pop-Location -Stack $cdStackName -ea ignore
