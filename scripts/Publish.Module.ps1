$script:PublishConf = [ordered]@{
    SelfScriptRoot = ( $SelfScriptRoot = Get-Item $PSScriptRoot )
    WorkspaceRoot  = Get-Item ( Join-Path $SelfScriptRoot '..' )
    OutputRoot     = Get-Item -ea 'stop' ( Join-Path $SelfScriptRoot '../BuildOutput' )
    ApiKeyName = 'PSGallery.Package.Marking'
}


$script:PublishConf | Format-Table -AutoSize

# todo(future): auto update manifest version, and hardcode exported commands to not use globs
# Update-PSModuleManifest

#region include files to copy
# Copy module to a clean directory to ensure publish does not include extra files

# cleanup existing:
Get-ChildItem -Recurse -Path $PublishConf.OutputRoot | Remove-Item -Verbose

@(
    Join-Path $PublishConf.WorkspaceRoot 'Marking.psd1'
    Join-Path $PublishConf.WorkspaceRoot 'Marking.psm1'
    # Join-Path $PublishConf.WorkspaceRoot 'readme.md'
) | Copy-Item -Destination $PublishConf.OutputRoot -Confirm:$false -Verbose
#endregion include files to copy

$PSGalleryKey ??= $env:PSGalleryApiKey ?? ( Get-Secret -Name $PublishConf.ApiKeyName -AsPlainText )

if ( -not $PSGalleryKey ) { throw 'ENV:\PSGalleryApiKey or secret name not defined' }
$publishPSResourceSplat = @{
    ApiKey          = $PSGalleryKey
    Repository      = 'PSGallery' # 'TestRepository'
    Path            = $PublishConf.OutputRoot

    # DestinationPath =
    # Confirm    = $true
    # WhatIf  = $true

    Verbose = $true
    Debug   = $true

    # Credential = 'cred'
    # SkipDependenciesCheck = $true
    # SkipModuleManifestValidate = $true
}

Publish-PSResource @publishPSResourceSplat
