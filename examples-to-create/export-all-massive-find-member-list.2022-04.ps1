
$allMembers ??= Find-Member
$allForce ??= Find-Member -Force
$t = $allForce | s -First 1
hr
$t | Format-Table
hr
$t | jProp
$t | jProp_basic
