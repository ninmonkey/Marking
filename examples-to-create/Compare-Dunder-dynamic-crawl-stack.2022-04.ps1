Write-Warning @'

bug:
    ForEach-Object: C:\Users\cppmo_000\SkyDrive\Documents\2021\Powershell\My_Github\Dev.Nin\pu
    blic_experiment\format\Format-Dict.ps1:522:24
    Line |
    522 |          $ToEnumerate | ForEach-Object {
        |                         ~~~~~~~~~~~~~~~~
        | Method invocation failed because [System.Int32] does not contain a
        | method named 'padright'.
'@

# _ -Scope 4



h1 '[2] stage 2 : Export Exceptions'

Write-Warning 'showErr -Recent; bug has inverted logic on boolean'
[hashtable]$ResultsDepth = @{}
$ScopeLevel = 0
try {
    while ($True) {
        $query = _ -Scope $ScopeLevel
        $resultsDepth[$ScopeLevel] = $query
        $ScopeLevel++
    }
} catch {
    Hr
    $_
    Hr
    'Caught max depth {0}' -f $ScopeLevel
}

$ResultsDepth | Format-Table -AutoSize
$ResultsDepth | Format-Dict


$ScopeLevel
$ResultsDepth.Keys
