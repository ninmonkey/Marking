# script version 0.3
# Push-Location -Path .
$ulJoinStr = @{
    DoubleQuote  = $true
    OutputPrefix = "`n- "
    Sep          = "`n- "
    OutputSuffix = "`n"
}

function _fmt_PBIPath {
    <#
    .synopsis
        minifies strings, for user
    .example
        PS> 'C:\Users\cppmo_000\Microsoft\Power BI Desktop Store App\FrownSnapShot1e0a1154-bc4d-4ea7-b3af-9800d9390b92.zip'
        | _fmt_PBIPath

            #outputs

            //~/Microsoft/Power BI Desktop Store App/FrownSnapShot1e0a1154-bc4d-4ea7-b3af-9800d9390b92.zip
    #>
    param(
        [Alias('string', 'Path', 'FullName')]
        [Parameter(ValueFromPipeline, Position = 0)]
        $InputObject
    )
    $re_pbiPRefix = '.*' + (Relit 'Microsoft\Power BI Desktop StoreApp')

    $re_AppStorePrefix = ('^.*Microsoft\\Power BI Desktop Store App')

    $accum = $InputObject
    $accum = $accum -replace $re_pbiPRefix, '//AppStore' # broken regex?
    $accum = $accum -replace $re_AppStorePrefix, '//PBI-AppStore'
    $accum = $accum -replace (Relit "$Env:UserProfile"), '//~'
    $accum = $accum -replace '\\', '/'
    return $accum
}
function Collect-PBIErrorLog {
    <#
    .SYNOPSIS
        Copy any zip files that a crash log is referencing
    .EXAMPLE

        PS> bug->CollectPBIErrors -PathOfLog '/crash-02/stack-trace.log'
    #>
    [Alias('bug->CollectPBIErrors')]
    param(
        # find the log
        [Parameter(Position = 0, Mandatory, ValueFromPipeline)]
        [string]$PathOfLog
    )
    $AppPath = @{ Root = Get-Item $PSSCriptRoot }
    Write-Warning '90% working just missing subdirs from the find command'

    $pathOfLog = $PathOfLog | stripANsi | Get-Item
    if (!(Test-Path $PathOfLog)) {
        throw "Log not found: '$PathOfLog'"
    }
    $Path = Get-Item -ea stop $PathOfLog

    Write-Verbose "searching: '$Path'"
    $findFiles = Get-Content $Path
    | Where-Object { $_ -match '^(c:\\.*\.zip)' }
    | Get-Item -ea 'continue'


    $DestPath = $Path.Directory | Get-Item
    if (! $DestPath ) {
        throw "unresolved dest path: '$DestPath'"
    }
    if ($FindFiles.count -le 0) {
        Write-Warning "Found zero zips in '$Path'"
        return
    }
    $path | To->RelativePath | Label 'LogPath' | Write-Information
    $FindFiles | _fmt_PBIPath | Join-String @ulJoinStr | Label 'FindFiles' | Write-Information


    'Copying Files to: "{0}" / "{1}", from:' -f @(
        $DestPath | To->RelativePath
        $DestPath
    )
    $FindFiles
    | ForEach-Object { $_ | _fmt_PBIPath }
    | Join-String @ulJoinStr { $_ | _fmt_PBIPath
    } # ullName ##{ $_.FullName | To->RelativePath }




    $FindFiles | Copy-Item -dest $DestPath # -Confirm

    # Get-ChildItem $DestPath | Format-Table -AutoSize
}

function Find-PBIErrorLog {
    <#
    synopsis
        Find potential craash logs, for collection
    #>
    param(
        # find the log
        [Parameter(Position = 0, ValueFromPipeline)]
        [string]$PathName = '.'
    )
    $Dir = Get-Item $PathName -ea Stop

    # & 'fd' @('-e', 'log', '-e', 'txt')

    # sort output, but preserve color output
    Label 'SortBy' 'DateModified Descending'
    & 'fd' @('-e', 'log', '-e', 'txt', '-c', 'always', '--base-directory', (Get-Item $Dir))
    | Sort-Object { $_ | StripAnsi | Get-Item | ForEach-Object LastWriteTime } -Descending

    # $actualEscape = '␛[38;5;81m.\␛[0m␛[38;5;243mcrash.log␛[0m' -replace '␛', "`e"
}

$LastRun = Get-Date

Find-PBIErrorLog -PathName '.'

Collect-PBIErrorLog -PathOfLog '2022-05-09-crash-on-obj-state\crash-02\stack-trace.log'

$RootDir = '.'

$allDebug = @{
    Verbose           = $true
    Debug             = $true
    InformationAction = 'Continue'
}

Find-PBIErrorLog -PathName $RootDir @allDebug
| Collect-PBIErrorLog @allDebug

h1 'Files Since LastRun'
Get-ChildItem -Path $RootDir -Recurse
| Where-Object {
    $_.LastWriteTime -gt $LastRun
}
