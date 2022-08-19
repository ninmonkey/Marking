$bin7z = Get-Command -CommandType Application '7z.exe' | Select-Object -First 1

& {

    h1 'step: Generate manpage root:  commands, and switches'
    $mPaths = @{
        # future: Update quality by using Resolve-FileInfo
        Root   = Get-Item $PSScriptRoot
        Export = Join-Path $PSScriptRoot '.input/manpage/7zip-root.txt'
    }
    $path = Join-Path $PSSCriptRoot $mPaths.Export
    $args7z = @(
        '--help'
    )
    & $bin7z @args7z
    | sc $mPaths.Export

    $mPaths.Export | Join-String -op 'Wrote: ' -DoubleQuote
    # | wi ?
}

& {

    class Man7zRecord {
        [string]$Prefix
        [string]$Description

        Man7zRecord(
            [string]$Line
        ) {
            $this.Prefix, $this.Description = $line -split '\s+:\s+'
            if ( [string]::IsNullOrWhiteSpace($This.Prefix) -or [string]::IsNullOrWhiteSpace($this.Description)) {
                throw 'Prefix or Description was blank'
            }
        }
    }
    $mPaths = @{
        # future: Update quality by using Resolve-FileInfo
        Root   = Get-Item $PSScriptRoot
        Import = Get-Item ( Join-Path $PSScriptRoot '.input/manpage/7zip-root.txt' )
    }
    h1 'step: Collect commands, and switches'



    $mPaths.Import | Join-String -op 'parsing: ' -DoubleQuote

    h1 '--> SubStage:
        ignoreUntil: <Commands>
        ignoreAfter <switches>
    '

    # $pathInput = Get-Item -ea stop (Join-Path $PSSCriptRoot '.input/manpage/7zip-root.txt')


    # "Parsing: $Path"
    # Get-Item $Path
    # | wi ?
}