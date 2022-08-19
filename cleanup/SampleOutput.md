### What triggered it

- I was in the Pwsh Integrated Debug Terminal [**PSIC**]
- I ran this silly script (in the term, not the editor)
- `Should` had been unused at that point, so I tried to import
- The import showed the virus error


```powershell
& {

        Get-Culture 'en-gb' -ea stop
        Get-Item -ea stop 'sdfsd'
        $false | Should -be $true -because 'Should never reach here'
    }
```

### environment

| .              | Version                                  |
| -------------- | ---------------------------------------- |
| **PowerShell** | **7.1.4**                                |
| code-insiders  | 1.62.0-insider                           |
| Commit         | 284e0db6c4cac1e557a43cd6691babdaafc2e1a9 |
| Date           | 2021-10-12T05:45 14.621Z                 |
| Electron       | 13.5.1                                   |
| Chrome         | 91.0.4472.164                            |
| Node.js        | 14.16.0                                  |
| V8             | 9.1.269.39-electron.0                    |
| OS             | Windows_NT x64 10.0.19043                |


### Addons

<details><summary>Summary (Click to Expand)

</summary>

| Name                                           | Version   |
| ---------------------------------------------- | --------- |
| GitHub.vscode-pull-request-github              | 0.32.0    |
| justin-grote.powershell-extension-pack         | 0.0.5     |
| ms-vscode.live-server                          | 0.2.9     |
| ms-vscode.powershell                           | 2021.10.2 |
| ms-vscode.powershell-preview                   | 2021.8.3  |
| ms-vscode.test-adapter-converter               | 0.1.4     |
| PowerQuery.vscode-powerquery                   | 0.1.23    |
| pspester.pester-test                           | 2021.10.2 |
| redhat.vscode-xml                              | 0.18.1    |
| redhat.vscode-yaml                             | 1.2.0     |
| TylerLeonhardt.vscode-inline-values-powershell | 0.0.5     |
| TylerLeonhardt.vscode-pester-test-adapter      | 0.0.23    |
| vscode-icons-team.vscode-icons                 | 11.7.0    |



</details>


![image](https://user-images.githubusercontent.com/3892031/141372226-fe1cb5dd-8e3e-4881-b398-99f38b9953ad.png)
