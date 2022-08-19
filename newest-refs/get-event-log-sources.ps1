
function _enumerateLogName {
    $LogNames = get-winevent -ListLog * -ea ignore | % LogName |  SOrt -unique -ov 'names'
    return $LogNames
}
_enumerateLogName 


Get-WinEvent -ListProvider *net*work* | Ft


