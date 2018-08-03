$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Should Assertion tests" {

    #negate anything
    $true | Should -Be $true
    $true | Should -Not -Be $false

    #Should Be

    $actual="Actual value"

    It "Tests Should -Be: Test will pass" {
        $actual | Should -Be "actual value"
    }

    It "Tests Should -Be: Test will fail" {
        $actual | Should -Be "not actual value"
    }

    #Uses Powershell Comparison Operators underneath
    'Peter' -gt 'Paul'
    'Paul' -gt 'Peter'
    7, 8, 9 -gt 8
    [version]1.0.0.1 -gt [version]2.3.4.5
    (Get-Date) -gt (Get-Date).AddMinutes(5)
}
