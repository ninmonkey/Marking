$ctorList = [System.Management.Automation.ErrorDetails] | fm -MemberType Constructor | Join-String -sep "`n"

# as source
@'
```csharp
{0}
```
'@ -f @(
    $ctorList | Join-String -sep "`n"
)


# or as table
