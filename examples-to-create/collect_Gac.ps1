
[System.AppDomain]::CurrentDomain.GetAssemblies() | Select-Object -Property * 
([System.AppDomain]::CurrentDomain.GetAssemblies() | Select-Object -Property *).ManifestModule



([System.AppDomain]::CurrentDomain.GetAssemblies() | Select-Object -Property *).ManifestModule|select -f 2 -Skip 45
