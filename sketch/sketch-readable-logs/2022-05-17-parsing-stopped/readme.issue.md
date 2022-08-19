- [ ] checklist
  - [ ] get version numbers,
  - [ ] get filepaths

**Actual behavior**

Code completion / Intellisense stops working. After this error

- new tabs (in the same window) can't use the extension.
- new tabs (id different windows) still work.

**To Reproduce**

My theories are:

- 1] there's a stale filepath, that isn't getting updated when file[s] move. The exception is fatal
- 2] filepaths have spaces
- 3] `file utils` was used, it may be involved, but the logs didn't show anything
     one of these, or both, are involved when using a move command . perhaps the trigger is there.     
    - [sleistner.vscode-fileutils](https://marketplace.visualstudio.com/items?itemName=sleistner.vscode-fileutils)
    - [patbenatar.advanced-new-file](https://marketplace.visualstudio.com/items?itemName=patbenatar.advanced-new-file)

- [the first one](https://marketplace.visualstudio.com/items?itemName=sleistner.vscode-fileutils) is used for `rename file`, `move file`, and `new file`. 


Please include the following:
* (Required) The Power Query script that triggers the issue.
* (Required) Any non-default settings used in the API call(s) which trigger the issue.
* (Ideally) A minimal reproducible example. Can you reproduce the problem by calling a function in `src/example.ts`?

**Additional context**
Add any other context about the problem here.

### Abbreviated Log: Window / Render3

## Log: Window/render3

```log
[2022-05-17 07:20:04.473] [renderer3] [critical] Extension 'ms-vsliveshare.vsliveshare' wants API proposal 'notebookDocumentEvents' but that proposal DOES NOT EXIST. Likely, the proposal has been finalized (check 'vscode.d.ts') or was abandoned.
[2022-05-17 07:20:04.521] [renderer3] [warning] [redhat.vscode-xml]: Cannot register 'redhat.telemetry.enabled'. This property is already registered.
[2022-05-17 07:20:04.521] [renderer3] [warning] [redhat.vscode-yaml]: Cannot register 'redhat.telemetry.enabled'. This property is already registered.
[2022-05-17 07:20:04.522] [renderer3] [warning] [streetsidesoftware.code-spell-checker]: Cannot register 'cSpell.enableFiletypes'. This property is already registered.
[2022-05-17 07:25:04.555] [renderer3] [warning] Settings pattern "keyboard.*" doesn't match any settings
```

Everything above is probably unrelated

```log
[2022-05-17 07:25:08.742] [renderer3] [info] Setting search error: Unexpected end of JSON input
[2022-05-17 07:25:08.760] [renderer3] [info] Setting search error: Unexpected end of JSON input

[2022-05-17 08:05:30.157] [renderer3] [error] [Extension Host] Unable to resolve path
        Ninmonkey.PowerQueryLib • WIP\Inspect.Anything.pq
        Ninmonkey.PowerQueryLib • .export\common_profile.pqlib.pq
        Ninmonkey.PowerQueryLib • .output\ninlib.pq
        Ninmonkey.PowerQueryLib • source\Inspect.Function.pq
        Ninmonkey.PowerQueryLib • source\Inspect.Metadata.pq
        Ninmonkey.PowerQueryLib • source\Inspect.Type.pq
        Ninmonkey.PowerQueryLib • source\old.Inspect.Metadata.pq
        Ninmonkey.PowerQueryLib • source\test\test_All.pbix-all.pq
        Ninmonkey.PowerQueryLib • .output\PowerQueryLib.pq
        Ninmonkey.PowerQueryLib • source\Inspect.MetaOfType.pq
        Ninmonkey.PowerQueryLib • source\Validate_TableSchema.old.pq
        Ninmonkey.PowerQueryLib • WIP\Inspect-Ast-Pair.pq
        Ninmonkey.PowerQueryLib • WIP\Inspect Text as Codepoints.pq
        Ninmonkey.PowerQueryLib • source\Inspect_TableColumn.pq
```


### Abbreviated Log: PowerQ query

```log
[Trace - 7:22:41 AM] Sending request 'textDocument/hover - (36)'.
Params: {
    "textDocument": {
        "uri": "untitled:Untitled-1"
    },
    "position": {
        "line": 55,
        "character": 24
    }
}


[Trace - 7:22:41 AM] Sending notification '$/cancelRequest'.
Params: {
    "id": 36
}


[Trace - 7:23:04 AM] Sending request 'textDocument/hover - (37)'.
Params: {
    "textDocument": {
        "uri": "untitled:Untitled-1"
    },
    "position": {
        "line": 56,
        "character": 150
    }
}


[Trace - 7:23:06 AM] Sending notification '$/cancelRequest'.
Params: {
    "id": 37
}


[Trace - 7:23:06 AM] Sending request 'textDocument/hover - (38)'.
Params: {
    "textDocument": {
        "uri": "untitled:Untitled-1"
    },
    "position": {
        "line": 55,
        "character": 92
    }
}



<--- Last few GCs --->

[3852:0000710C00328000]   141068 ms: Scavenge 3498.2 (3963.8) -> 3495.3 (3966.3) MB, 14.0 / 0.0 ms  (average mu = 0.509, current mu = 0.342) allocation failure 
[3852:0000710C00328000]   142236 ms: Scavenge 3501.7 (3966.3) -> 3498.8 (3968.0) MB, 1156.3 / 0.0 ms  (average mu = 0.509, current mu = 0.342) allocation failure 
[3852:0000710C00328000]   142298 ms: Scavenge 3505.1 (3968.0) -> 3502.4 (3968.0) MB, 51.0 / 0.0 ms  (average mu = 0.509, current mu = 0.342) allocation failure 


<--- JS stacktrace --->

FATAL ERROR: NewSpace::Rebalance Allocation failed - JavaScript heap out of memory
 1: 00007FF77D434A16 node::Buffer::New+50294
 2: 00007FF77D434C1F node::OnFatalError+463
 3: 00007FF77FF489DA v8::Data::IsFixedArray+842
 4: 00007FF77FF4892C v8::Data::IsFixedArray+668
 5: 00007FF780019FD3 v8::JSHeapConsistency::CheckWrapper+68179
 6: 00007FF77C9CAD97 cppgc::DefaultPlatform::MonotonicallyIncreasingTime+133511
 7: 00007FF77C9C79DD cppgc::DefaultPlatform::MonotonicallyIncreasingTime+120269
 8: 00007FF77EA5A20F v8::CppHeap::GetHeapHandle+81023
 9: 00007FF77EA48F38 v8::CppHeap::GetHeapHandle+10664
10: 00007FF77E924C3A uv_random+6523722
11: 00007FF77EA4911E v8::CppHeap::GetHeapHandle+11150
12: 00007FF77EB87BB5 v8::CppHeap::GetHeapHandle+1316389
13: 00007FF77EB614E8 v8::CppHeap::GetHeapHandle+1159000
14: 00007FF77EAF2042 v8::CppHeap::GetHeapHandle+703154
15: 0000026207F0B23C 
[Trace - 7:23:08 AM] Sending notification '$/cancelRequest'.
Params: {
    "id": 38
}


[Trace - 7:23:08 AM] Sending request 'textDocument/hover - (39)'.
Params: {
    "textDocument": {
        "uri": "untitled:Untitled-1"
    },
    "position": {
        "line": 52,
        "character": 20
    }
}


[Error - 7:23:08 AM] Connection to server is erroring. Shutting down server.
[Trace - 7:23:08 AM] Sending request 'shutdown - (40)'.
[Error - 7:23:08 AM] Connection to server is erroring. Shutting down server.

```

### Abbreviated Log: Extension Host

```log
[2022-05-17 07:20:05.883] [exthost] [info] Extension host with pid 21092 started
    [info]
        Skipping acquiring lock for c:\Users\cppmo_000\AppData\Roaming\Code\User\workspaceStorage\fd079ebb8e066729a005865eba617694.
        ExtensionService#_doActivateExtension
        mechatroner.rainbow-csv, startup: false, activationEvent: 'onLanguage:plaintext'
        PowerQuery.vscode-powerquery, startup: false, activationEvent: 'onLanguage:powerquery'
        VisualStudioExptTeam.vscodeintellicode, startup: false, activationEvent: 'onLanguage:sql'
        vscode.debug-auto-launch, startup: true, activationEvent: '*'
        vscode.git-base, startup: true, activationEvent: '*', root cause: vscode.git
        vscode.ipynb, startup: true, activationEvent: '*'
        christian-kohler.path-intellisense, startup: true, activationEvent: '*'
        ms-vscode.test-adapter-converter, startup: true, activationEvent: '*', root cause: orer-status-bar
        Equinusocio.vsc-material-theme, startup: true, activationEvent: '*'
        equinusocio.vsc-material-theme-icons, startup: true, activationEvent: '*'
        GitHub.vscode-pull-request-github, startup: true, activationEvent: '*'
        johnpapa.vscode-peacock, startup: true, activationEvent: '*'
        kamikillerto.vscode-colorize, startup: true, activationEvent: '*'
        mhutchie.git-graph, startup: true, activationEvent: '*'
        ms-mssql.data-workspace-vscode, startup: true, activationEvent: '*'
        svipas.control-snippets, startup: true, activationEvent: '*'
        tomoki1207.selectline-statusbar, startup: true, activationEvent: '*'
        vscode-icons-team.vscode-icons, startup: true, activationEvent: '*'
        WallabyJs.quokka-vscode, startup: true, activationEvent: '*'
        yzhang.markdown-all-in-one, startup: true, activationEvent: 'workspaceContains:README.md'
        vscode.markdown-math, startup: false, activationEvent: 'api', root cause: yzhang.

     Not activating extension 'ms-dotnettools.csharp': Timed out while searching for 'workspaceContains' pattern **/*.{csproj,sln,slnf,
        'ms-playwright.playwright': Timed out while searching for 'workspaceContains' pattern **/*playwright*.
        'ms-python.pylint': Timed out while searching for 'workspaceContains' pattern *.py
        'pspester.pester-test': Timed out while searching for 'workspaceContains' pattern **/*.[tT]ests.[pP][sS]1
        'TylerLeonhardt.vscode-pester-test-adapter': Timed out while searching for 'workspaceContains' pattern **/
     
     ExtensionService#_doActivateExtension
        vscode.emmet, startup: false, activationEv1ent: 'onStartupFinished'
        vscode.merge-conflict, startup: false, activationEvent: 'onStartupFinished'
        ms-vscode-remote.remote-wsl-recommender, startup: false, activationEvent: 'onStartupFinished'
        alefragnani.Bookmarks, startup: false, activationEvent: 'onStartupFinished'
        baincd.mini-command-palettes, startup: false, activationEvent: 'onStartupFinished'
        dbaeumer.vscode-eslint, startup: false, activationEvent: 'onStartupFinished'
        dsznajder.es7-react-js-snippets, startup: false, activationEvent: 'onStartupFinished'
        eamodio.gitlens, startup: false, activationEvent: 'onStartupFinished'
        esbenp.prettier-vscode, startup: false, activationEvent: 'onStartupFinished'
        ms-python.python, startup: false, activationEvent: 'onStartupFinished', root cause: -test-adapter
        ms-vscode-remote.remote-containers, startup: false, activationEvent: 'onStartupFinished'
        ms-vscode-remote.remote-wsl, startup: false, activationEvent: 'onStartupFinished'
        PKief.material-icon-theme, startup: false, activationEvent: 'onStartupFinished'
        streetsidesoftware.code-spell-checker, startup: false, activationEvent: 'onStartupFinished'
        TylerLeonhardt.vscode-terminalcommanddocs, startup: false, activationEvent: 'onStartupFinished'

[2022-05-17 07:20:18.182] [exthost] [info]
    ExtensionService#_doActivateExtension
        usernamehw.errorlens, startup: false, activationEvent: 'onStartupFinished'
        zhuangtongfa.material-theme, startup: false, activationEvent: 'onStartupFinished'
        vscode.microsoft-authentication, startup: false, activationEvent: 'onAuthenticationRequest:microsoft'
        vscode.git, startup: true, activationEvent: '*'
        vscode.github, startup: true, activationEvent: '*'
        hbenl.vscode-test-explorer, startup: true, activationEvent: '*', root cause: connorshea.vscode-test-explorer-status-bar
        vscode.github-authentication, startup: false, activationEvent: 'onAuthenticationRequest:github'
        connorshea.vscode-test-explorer-status-bar, startup: true, activationEvent: '*'
        hbenl.vscode-mocha-test-adapter, startup: true, activationEvent: '*'
        littlefoxteam.vscode-python-test-adapter, startup: false, activationEvent: 'onStartupFinished'

[2022-05-17 07:20:56.141] [exthost] [info] Eager extensions activated
[2022-05-17 07:24:13.913] [exthost] [info]
    ExtensionService#_doActivateExtension
        vscode.search-result, startup: false, activationEvent: 'onLanguage:search-result'
        vscode.configuration-editing, startup: false, activationEvent: 'onLanguage:jsonc'
        vscode.json-language-features, startup: false, activationEvent: 'onLanguage:jsonc'
        vscode.typescript-language-features, startup: false, activationEvent: 'onLanguage:jsonc'
        sleistner.vscode-fileutils, startup: false, activationEvent: 'onCommand:fileutils.moveFile'
```
