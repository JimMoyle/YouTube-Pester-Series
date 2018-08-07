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

Get-Help Should

# Should docs https://github.com/pester/Pester/wiki/Should

Describe "Should Assertion tests" {

    #Old Formatting

    It "Tests Negation: Test will pass" {
        $true | Should Be $true
    }


    #negate anything

    It "Tests Negation: Test will pass" {
        $true | Should -Be $true
    }

    It "Tests Negation: Test will pass" {
        $true | Should -Not -Be $false
    }

    # Should -Be

    $actual = "Actual value"

    It "Tests Should -Be: Test will pass" {
        $actual | Should -Be "actual value"
    }

    It "Tests Should -Be: Test will fail" {
        $actual | Should -Be "not actual value"
    }

     # Should -BeExactly

    It "Tests Should -BeExactly: Test will pass" {
        $actual | Should -BeExactly "Actual value" 
    }

    It "Tests Should -BeExactly: Test will fail" {
        $actual | Should -BeExactly "not actual value"
    }

    # Should -BeGreaterThan

    It "Tests Should -BeGreaterThan: Test will pass" {
        $Error.Count | Should -BeGreaterThan 0
    }

    # Uses Powershell Comparison Operators underneath
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

    # Should -BeGreaterOrEqual
    # Uses PowerShell's -ge operator to compare the two values.
    It "Tests Should -BeGreaterOrEqual: Test will pass" {
        2 | Should -BeGreaterOrEqual 0
    }

    It "Tests Should -BeGreaterOrEqual: Test will pass" {
        2 | Should -BeGreaterOrEqual 2
    }

    # Should -BeIn
    # Asserts that the actual value is contained by the array/collection
    It "Tests Should -BeIn: Test will pass" {
        'b' | Should -BeIn @('a', 'b', 'c')
    }

    It "Tests Should -BeIn: Test will pass" {
        27 | Should -BeIn (1..100)
    }

    # Should -BeLessThan
    # Uses PowerShell's -lt operator to compare the two values.
    It "Tests Should -BeLessThan: Test will pass" {
        $Error.Clear()
        $Error.Count | Should -BeLessThan 1
    }

    # Should -BeLessOrEqual
    # Uses PowerShell's -le operator to compare the two values.
    It "Tests Should -BeLessOrEqual: Test will pass" {
        1 | Should -BeLessOrEqual 10
    }

    It "Tests Should -BeLessOrEqual: Test will pass" {
        10 | Should -BeLessOrEqual 10
    }

    # Should -BeLike
    # Uses PowerShell's -like operator to compare the two values.

    $actual = "Actual value"

    It "Tests Should -BeLike: Test will pass" {
        $actual | Should -BeLike "actual *"
    }

    It "Tests Should -BeLike: Test will pass" {
        $actual | Should -Not -BeLike "not actual *"
    }

    # Should -BeLikeExactly
    # Uses PowerShell's -clike operator to compare the two values.
    # This comparison is case-sensitive.

    $actual = "Actual value"

    It "Tests Should -BeLikeExactly: Test will pass" {
        $actual | Should -BeLikeExactly "Actual *"
    }

    It "Tests Should -BeLikeExactly: Test will pass" {
        $actual | Should -Not -BeLikeExactly "actual *"
    }

    # Should -BeOfType
    # Uses PowerShell's -clike operator to compare the two values.
    # This comparison is case-sensitive.

    $actual = Get-Item $env:SystemRoot
    $actual.GetType()

    It "Tests Should -BeOfType: Test will pass" {
        $actual | Should -BeOfType System.IO.DirectoryInfo
    }

    It "Tests Should -BeOfType: Test will pass" {
        $actual | Should -BeOfType System.IO.FileSystemInfo
    }

    It "Tests Should -BeOfType: Test will pass" {
        $actual | Should -Not -BeOfType System.IO.FileSystemInfo
    }
    

}
