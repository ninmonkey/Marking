<#
.SYNOPSIS
    Helper functions only used by pester tests.
#>

$PSStyle.OutputRendering = 'Host' # for pester outputs

function Str.Predent {
    param( [int] $Depth = 1 )
    $prefix = '  ' * $depth -join ''
    $Input | Join-String -f "${prefix}{0}"
}
function Log.Warn {
    <#
    .SYNOPSIS
        Logs severity level: warn, to pester log indented with color
    #>
    param( [int] $Depth = 1, [string] $Title = 'Warn' )
    $Input
    | New-Text -bg $null -fg 'salmon' # '#333333'
    | Join-String -op "${Title}: "
    | Str.Predent -Depth $Depth
    | Write-host
}
function Log.Dim {
    <#
    .SYNOPSIS
        Logs severity level: Dim, to pester log indented with color
    #>
    param( [int] $Depth = 1 )
    $Input
    | New-Text -bg $null -fg '#666666' # '#333333'
    | Str.Predent -Depth $Depth
    | Write-host
}
function Log.Info {
    <#
    .SYNOPSIS
        Logs severity level: info, to pester log indented with color
    #>
    param( [int] $Depth = 1 )
    $Input
    | New-Text -bg '#67c8da' -fg '#333333'
    | Str.Predent -Depth $Depth
    | Write-host
}

function Date.FromStr  {
    <#
    .SYNOPSIS
        Create a [DateTime] from a DateOnly string
    #>
    [OutputType( [datetime] )]
    [cmdletBinding()]
    param(
        [Parameter(ValueFromPipeline, Position = 0)]
        [Alias('Text')]
        [string] $DateStr,

        [Parameter( Position = 1)]
        [string] $Culture = 'en-us',

        [Parameter( Position = 2)]
        [string] $Format = 'yyyy-MM-dd'
    )
    begin {
        $cult = [cultureinfo]::GetCultureInfo($Culture)
    }
    process {
        $date = [datetime]::ParseExact( $DateStr, $Format, $cult )
        if( $null -eq $date ) {
            throw "Date.FromStr: Failed to parse date string '${DateStr}',  Culture: ${Culture}, Format: ${Format}"
        }
        return $date
    }
}
function Date.Str  {
    <#
    .SYNOPSIS
        Create a [DateTime] from a DateOnly string
    .example
        Date.Str ([datetime]::now)
        Date.Str ([datetime]::now) -Culture 'de-de'
        '2024-03-03' | Date.Str
    #>
    [OutputType( [string] )]
    [cmdletBinding()]
    param(
        [Parameter( ValueFromPipeline, Position = 0)]
        [datetime] $Date,

        [Parameter( Position = 1)]
        [string] $Culture = 'en-us',

        [Parameter( Position = 2)]
        [string] $Format = 'yyyy-MM-dd'
    )
    begin {
        $cult = [cultureinfo]::GetCultureInfo($Culture)
    }
    process {
        [string] $display = $Date.ToString( $Format, $cult )
        if( [string]::IsNullOrWhiteSpace( $display ) ) {
            throw "Date.Str: Failed to format date '${Date}',  Culture: ${Culture}, Format: ${Format}"
        }
        return $display
    }
}

function Helper.WorkspaceRoot {
    <#
    .synopsis
        Get the workspace root, without relying on global variables being in scope
    #>
    Get-Item -ea 'stop' ( Join-Path $PSScriptRoot '..'  )
}

function Helper.Invoke-RestMethod {
    <#
    .synopsis
        Calls GitServe on the correct host and port name based on config
    .example
        Helper.Invoke-RestMethod -RelativePath 'repo/list'
    #>
    param(
        [Alias('RelativeUrl')]
        [string] $RelativePath,
        $Body,
        $Method # = 'GET'
    )

    $HostPrefix = (GitServe.Get-ConfigHost).Url # ex: 'http://127.0.0.1:3001'
    $splat = @{
        SkipHttpErrorCheck = $true
        StatusCodeVariable = 'Status'
    }
    if( $Body ) { $splat.Body = $Body }
    if( $Method ) { $splat.Method = $Method }

    [uri] $Url = "${HostPrefix}/${RelativePath}"
    Invoke-RestMethod -Uri $Url @splat

    if( $Status -notmatch '2\d+' ) {
        # do nothing because it's a test?
    }
}
