- [About](#about)
- [Todo](#todo)
- [Config Paths](#config-paths)
  - [UserDataDir:](#userdatadir)
  - [ExtensionsDir:](#extensionsdir)
  - [User Settings Dir](#user-settings-dir)
- [Links](#links)

# About

VS Code

# Todo

- [ ] coerce `enum` from strings 'code.cmd' and 'code-insiders.cmd' to [VSCodeAppType_vs]
- [ ] better json coercion of `[IO.FileInfo]$AppPath` as a single string

# Config Paths

## UserDataDir:

- `%APPDATA%\Code`
- `$HOME/.config/Code`

## ExtensionsDir:

- `%USERPROFILE%\.vscode\extensions`
- `~/.vscode/extensions`

## User Settings Dir
   
- `%AppData%\Code\User`


# Links

- <https://code.visualstudio.com/docs/getstarted/tips-and-tricks#_command-line>
- [vsce](https://code.visualstudio.com/api/working-with-extensions/publishing-extension#vsce)
- <https://code.visualstudio.com/api/working-with-extensions/continuous-integration>
- <https://code.visualstudio.com/docs/editor/portable>