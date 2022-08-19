$savedException ??= @{}
$PSDefaultParameterValues['RecentError:Infa'] = 'Continue'

# blog post: neat place to use info

function _find-RecentError {
    param(
        # do *not* clear err counter reset? ( not clear )
        [Alias('SkipCounterReset')]
        [switch]$DoNotResetRecency,

        # remove all $error records  ( does clear )
        [Alias('EraseAfter')]
        [switch]$ClearAfter
    )
    $dbg = @{}

    if ($null -eq $Error -or $error.count -le 0) {
        Write-Error 'NoErrorFoundException' -ErrorId '?'
    }

    $dbg['IsNull?'] = $null -eq $Error
    $dbg['ErrorCount'] = $Error.count
    $dbg['FuncParams:DoNotReset'] = $DoNotResetRecency
    $dbg['FuncParams:ClearAfter'] = $ClearAfter

    $recentCount = (err -PassThru).DeltaCount # | ForEach-Object DeltaCount
    $recentErrors = $Error | Select-Object -First $recentCount
    $recentErrors.count | Should -BeExactly $recentCount -Because 'Otherwise indexing is off'

    $dbg['DeltaCount'] = $recentCount
    $dbg['FoundErrorCount'] = $recentErrors.count

    if (! $DoNotResetRecency ) {
        err -Reset
    }
    if ($EraseAfter) {
        err -Clear
    }
    $dbg | Format-dict | Out-String | Write-Information
    $dbg | Format-Table | Out-String | Write-Information
    return $recentErrors
}

Write-Warning 'ask what error sould be used for having no errors heh'
$savedException['ScopeError'] = _find-RecentError

# capture1
_ -Scope 5


$error[0].Exception | jProp | Sort-Object type
Hr
$error[0].Exception.Data | jProp
