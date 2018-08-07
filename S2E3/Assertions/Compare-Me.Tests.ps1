<#
	===========================================================================
	 Created on:   	2018/08/02
	 Created by:   	Jim Moyle
	 GitHub link: 	https://github.com/JimMoyle/YouTube-Pester-Series
	 Twitter: 		@JimMoyle
	===========================================================================
#>


$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Should Assertion tests" {

    #negate anything

    It "Tests Negation: Test will pass" {
        $true | Should -Be $true
    }

    It "Tests Negation: Test will pass" {
        $true | Should -Not -Be $false
    }

    #Should Be

    $actual="Actual value"

    It "Tests Should -Be: Test will pass" {
        $actual | Should -Be "actual value"
    }

    It "Tests Should -Be: Test will fail" {
        $actual | Should -Be "not actual value"
    }

    It "Tests Should -BeExactly: Test will pass" {
        $actual | Should -BeExactly "Actual value" 
    }

    It "Tests Should -BeExactly: Test will fail" {
        $actual | Should -BeExactly "not actual value"
    }

    It "Tests Should -BeGreaterThan: Test will pass" {
        $Error.Count | Should -BeGreaterThan 0
    }

    #Uses Powershell Comparison Operators underneath
    'Peter' -gt 'Paul'
    'Paul' -gt 'Peter'
    [version]'2.3.4.5' -gt [version]'1.0.0.1'
    (Get-Date).AddMinutes(5) -gt (Get-Date)
    7, 8, 9 -gt 8

    It "Tests Should -BeGreaterThan: Test will fail" {
        'Peter' | Should -BeGreaterThan 'Paul'
    }

    It "Tests Should -BeGreaterThan: Test will pass" {
        'Paul' | Should -BeGreaterThan 'Peter'
    }

    It "Tests Should -BeGreaterThan: Test will pass" {
        [version]'2.3.4.5' | Should -BeGreaterThan ([version]'1.0.0.1')
    }

    It "Tests Should -BeGreaterThan: Test will pass" {
        (Get-Date).AddMinutes(5) | Should -BeGreaterThan (Get-Date)
    }

    It "Tests Should -BeGreaterThan: Test will fail" {
        7, 8, 9 | Should -BeGreaterThan 8
    }

    It "Corrected test for '7, 8, 9 -gt 8': Test will pass" {
        7, 8, 9 -gt 8 | Should -Be 9
    }



}
