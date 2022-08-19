$script:_topLevel = 'stuff'
function foo {
    $_auto_infn = 'bar'
    $script:_explicit_script = 'foo'
    $no = 0
}

foo

h1 'state like this'
$state = @{}

$state.global = Get-Variable '_*' -Scope global | Sort-Object
| Where-Object Name -NotMatch '__.*'
$state.local = Get-Variable '_*' -Scope local | Sort-Object
| Where-Object Name -NotMatch '__.*'

#Get-Variable '_*' -Scope local | sort
#| ? Name -NotMatch '__.*'
