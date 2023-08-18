# Marking

Minimal Markdown module, to generate markdown from PowerShell

## First

generate file: 

- [ ] 'G:\2021-github-downloads\Power-BI\microsoft📁\readme.🐒.md'

## See Also

- [GenerateSignatureMarkdown.ps1](https://github.com/SeeminglyScience/ClassExplorer/blob/signature-query/tools/GenerateSignatureMarkdown.ps1)
Minimal Markdown module, to generate markdown, or html from PowerShell

Mainly dynamic table generation.

## Todo

### markdown

- [ ] PSCO to Markdown table
- [ ] folder of files to markdown list of links
- [ ] Sourcecode to language code-fence
  - [ ] `$src | Invoke-Formatter | ConvertTo-MDFences -Lang $src.extension`

### html

- [ ] PSCO to html table
- [ ] Sourcecode to language code-fence

### console? 

- [ ] Sourcecode to language code-fence
  - [ ] `$src | Invoke-Formatter | Bat -lang $src.extension`

### future

- use a real Markdown AST Parser
  - then reading from raw MD tables, sorting, then writing, would be feasable 

## See also: 

- https://github.com/indented-automation/Indented.ChocoPackage
- https://github.com/indented-automation/Indented.Build
- https://github.com/indented-automation/Indented.StubCommand
- https://github.com/indented-automation/LocalMachine
- https://github.com/nightroman/Invoke-Build

## empty: 

- https://github.com/ninmonkey/Ninmonkey.ModuleData
- https://github.com/ninmonkey/Powershell-TextTemplates
