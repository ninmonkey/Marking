BeforeAll {
    $PSStyle.OutputRendering = 'Ansi'

    Get-Module Marking | Remove-Module

    $rebuildModuleScript = Mint.Require-File -WithoutCreate -Path (Join-Path ($PSScriptRoot ? $PSScriptRoot : '.') '../../../Build/marking.Build.Module.ps1' )
    . $RebuildModuleScript

    $modPath = Join-Path $PSScriptRoot '../../../Marking.psd1' | Get-Item -ea 'stop'
    Import-Module $modPath -ea 'stop' -Force -PassThru
        | Join-String -sep ', ' { $_.Name, $_.Version -join ': ' }
        | Write-Host -fg SlateBlue
}
Describe 'Marking.StringBuilder' {
    It 'StrBuilder.Append: refactor case1' {
        $render = @(
            Marking.StringBuilder.Clear
            0..3 | Marking.StringBuilder.Append
            Marking.StringBuilder.ToString
        )

        $render.Count | Should -BeExactly 1
        $render -replace '\r?\n', '' | Should -BeExactly '0123'
    }
    It 'StrBuilder.Append: refactor case2' {
        $render = @(
            Marking.StringBuilder.Clear
            0..3 | Marking.StringBuilder.Append -Sep "`n"
            Marking.StringBuilder.ToString
        )

        $render.Count | Should -BeExactly 1
        $render -replace '\r?\n', "`n" | Should -BeExactly "0`n1`n2`n3`n"

        $accum = $render -replace '\r?\n', "`n"
        $accum.Trim()
            | Should -BeExactly "0`n1`n2`n3"
    }
    It 'StrBuilder By Reference' {
        [System.Text.StringBuilder] $sbTest = ''
        Mark.StringBuilder.Clear -StrBuilder $sbTest
        0..1 | Mark.StringBuilder.Append -StrBuilder $sbTest
        2..3 | Mark.StringBuilder.Append -StrBuilder $sbTest
        Mark.StringBuilder.ToString -StrBuilder $sbTest

        ( ( Mark.StringBuilder.ToString -StrBuilder $sbTest  ) -replace '\r?\n', "`n" ).trim()
            | Should -BeExactly "01`n23" -Because 'Manually crafted'

        $sbTest.ToString() -EQ ( Mark.StringBuilder.ToString -StrBuilder $sbTest )
            | Should -Be $True -Because 'It Should be the same reference'
    }
}
