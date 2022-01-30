$verbs ??= Get-NinVerb
$verbs | s BasicNouns | ConvertTo-Yaml
$verbs | s BaseObject | ConvertTo-Json #
