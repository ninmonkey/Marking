

# function Who-IsNotAlone {
#     $tlist = @{}

#     $tlist.IsNotType = Find-Type
#     | Where-Object { !($_.FullName -as 'type' -is 'type') }

#     $tlist.IsAType = Find-Type
#     | Where-Object { ($_.FullName -as 'type' -is 'type') }

#     $meta = [ordered]@{

#         IsAType   = $tlist.IsAType
#         IsNotType = $tlist.IsNotType
#         IsAType   = $tlist.IsAType.count
#         IsNotType = $tlist.IsNotType.count
#     }
#     [pscustomobject]$meta
# }




$map = @{
    color  = 'blue'
    name   = 'bob'
    gender = 'His'
    'cat'  = '🐱'
}

$template = @'
This a block of text. Here is a color {{color}}.
{{name}} should be able {{cat dog}} {{dog}}ad this with {{gender}} name in it
'@

function newToken {
    param([String]$Token)
    @(
        [regex]::escape( '{{')
        $Token
        [regex]::escape( '}}')
    ) -join ''
}



$ErrorActionPreference = 'break'
$mapping = @(
    @{
        # Token       = 'cat.*dog'
        Token       = 'cat.*?dog'
        Replacement = '🐱🐶'
    }
    @{
        Token       = 'dog'
        Replacement = '🐶'
    }
    @{
        Token       = 'cat'
        Replacement = '🐱'
    }
    @{
        Token       = 'name'
        Replacement = 'bob'
    }
) | ForEach-Object {

    $_.Token = newToken $_.Token
    # $_.Token = $tokenTemplate -f @(
    #     $_.TOken
    # )
    [pscustomobject]$_
}
$mapping2 = @(
    @{
        # Token       = 'cat.*dog'
        Token       = 'cat.*dog'
        Replacement = '🐱🐶'
    }
    @{
        Token       = 'dog'
        Replacement = '🐶'
    }
    @{
        Token       = 'cat'
        Replacement = '🐱'
    }
    @{
        Token       = 'name'
        Replacement = 'bob'
    }
) | ForEach-Object {

    $_.Token = newToken $_.Token
    # $_.Token = $tokenTemplate -f @(
    #     $_.TOken
    # )
    [pscustomobject]$_
}


function _render {
    param(
        [String]$Accum = $Template,
        [object]$Mapping = $Mapping
    )
    $accum = $template
    # $ErrorActionPreference = 'stop'


    foreach ($map in $mapping) {

        $accum = $accum -replace $map.Token, $Map.Replacement

    }
    return $accum
}


function debugTest-Mapping {
    param(
        [string]$Source,
        [object]$Mapping
    )
    H1 'Mapping'
    # $mapping | Format-Table
    $mapping | ForEach-Object { [pscustomobject]$_ }

    H1 'Start'
    $Source

    H1 'Replacement'
    _render -Accum $Source -Mapping $Mapping
}

# $mapping | Format-Table
# h1 'template'
# $template
# h1 'accum'
# $accum

# _render -Accum $template -Mapping $mapping
# _render -Accum $template -Mapping $mapping2

debugTest-Mapping -Source $template -Mapping $mapping
debugTest-Mapping -Source $template -Mapping $mapping2
return
#     # $Cat = $TokenTemplate -f 'cat.*?dog'
#     # $Template -replace $cat, p
# foreach ($p in $map) {

# }


# # $re = [regex]::New('\[(.*?)\]')
# # $re.Replace($template, {
# #         param($s)
# #         $map[$s.Groups[1].Value]
# #     })
