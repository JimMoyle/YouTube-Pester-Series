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
. '$here\$sut'

Get-Help Should

# Should docs https://github.com/pester/Pester/wiki/Should

Describe 'Should Assertion tests' {

    #Old Formatting pre pester 4.0 remember Pester is 3.4 without upgrading

    It 'Tests Negation: Test will pass' {
        $true | Should Be $true
    }


    #negate anything

    It 'Tests Negation: Test will pass' {
        $true | Should -Be $true
    }

    It 'Tests Negation: Test will pass' {
        $true | Should -Not -Be $false
    }

    # Should -Be

    $actual = 'Actual value'

    It 'Tests Should -Be: Test will pass' {
        $actual | Should -Be 'actual value'
    }

    It 'Tests Should -Be: Test will fail' {
        $actual | Should -Be 'not actual value'
    }

     # Should -BeExactly

    It 'Tests Should -BeExactly: Test will pass' {
        $actual | Should -BeExactly 'Actual value' 
    }

    It 'Tests Should -BeExactly: Test will fail' {
        $actual | Should -BeExactly 'not actual value'
    }

    # Should -BeGreaterThan

    It 'Tests Should -BeGreaterThan: Test will pass' {
        $Error.Count | Should -BeGreaterThan 0
    }

    # Uses Powershell Comparison Operators underneath
    'Peter' -gt 'Paul'
    'Paul' -gt 'Peter'
    [version]'2.3.4.5' -gt [version]'1.0.0.1'
    (Get-Date).AddMinutes(5) -gt (Get-Date)
    7, 8, 9 -gt 8

    It 'Tests Should -BeGreaterThan: Test will fail' {
        'Peter' | Should -BeGreaterThan 'Paul'
    }

    It 'Tests Should -BeGreaterThan: Test will pass' {
        'Paul' | Should -BeGreaterThan 'Peter'
    }

    It 'Tests Should -BeGreaterThan: Test will pass' {
        [version]'2.3.4.5' | Should -BeGreaterThan ([version]'1.0.0.1')
    }

    It 'Tests Should -BeGreaterThan: Test will pass' {
        (Get-Date).AddMinutes(5) | Should -BeGreaterThan (Get-Date)
    }

    It 'Tests Should -BeGreaterThan: Test will fail' {
        7, 8, 9 | Should -BeGreaterThan 8
    }

    It 'Corrected test for '7, 8, 9 -gt 8': Test will pass' {
        7, 8, 9 -gt 8 | Should -Be 9
    }

    # Should -BeGreaterOrEqual
    # Uses PowerShell's -ge operator to compare the two values.
    It 'Tests Should -BeGreaterOrEqual: Test will pass' {
        2 | Should -BeGreaterOrEqual 0
    }

    It 'Tests Should -BeGreaterOrEqual: Test will pass' {
        2 | Should -BeGreaterOrEqual 2
    }

    # Should -BeIn
    # Asserts that the actual value is contained by the array/collection
    It 'Tests Should -BeIn: Test will pass' {
        'b' | Should -BeIn @('a', 'b', 'c')
    }

    It 'Tests Should -BeIn: Test will pass' {
        27 | Should -BeIn (1..100)
    }

    # Should -BeLessThan
    # Uses PowerShell's -lt operator to compare the two values.
    It 'Tests Should -BeLessThan: Test will pass' {
        $Error.Clear()
        $Error.Count | Should -BeLessThan 1
    }

    # Should -BeLessOrEqual
    # Uses PowerShell's -le operator to compare the two values.
    It 'Tests Should -BeLessOrEqual: Test will pass' {
        1 | Should -BeLessOrEqual 10
    }

    It 'Tests Should -BeLessOrEqual: Test will pass' {
        10 | Should -BeLessOrEqual 10
    }

    # Should -BeLike
    # Uses PowerShell's -like operator to compare the two values.

    $actual = 'Actual value'

    It 'Tests Should -BeLike: Test will pass' {
        $actual | Should -BeLike 'actual *'
    }

    It 'Tests Should -BeLike: Test will pass' {
        $actual | Should -Not -BeLike 'not actual *'
    }

    # Should -BeLikeExactly
    # Uses PowerShell's -clike operator to compare the two values.
    # This comparison is case-sensitive.

    $actual = 'Actual value'

    It 'Tests Should -BeLikeExactly: Test will pass' {
        $actual | Should -BeLikeExactly 'Actual *'
    }

    It 'Tests Should -BeLikeExactly: Test will pass' {
        $actual | Should -Not -BeLikeExactly 'actual *'
    }

    # Should -BeOfType
    # Uses PowerShell's -clike operator to compare the two values.
    # This comparison is case-sensitive.

    $actual = Get-Item $env:SystemRoot
    $actual.GetType()

    It 'Tests Should -BeOfType: Test will pass' {
        $actual | Should -BeOfType [System.IO.DirectoryInfo]
    }

    It 'Tests Should -BeOfType: Test will pass' {
        $actual | Should -BeOfType [System.IO.FileSystemInfo]
    }

    It 'Tests Should -BeOfType: Test will pass' {
        $actual | Should -Not -BeOfType [System.IO.FileInfo]
    }

    $customObject = [PSCustomObject]@{
        PSTypeName = 'MadeUp.Type'
        SomeName   = 'SomeValue'
    }

    It 'Tests Should -BeOfType: Test will fail' {
        $customObject | Should -BeOfType [MadeUp.Type]
    }

    It 'Tests Should -BeOfType Sorta: Test will pass' {
        $customObject.pstypenames.Item('0') | Should -Be 'MadeUp.Type'
    }

    # Should -BeTrue
    # Uses If(){} from PowerShell under the hud
    # Jeffery Snover on If
    # https://blogs.msdn.microsoft.com/powershell/2006/12/24/boolean-values-and-operators/

    It 'Tests Should -BeTrue: Test will pass' {
        $true | Should -BeTrue
    }

    It 'Tests Should -BeTrue: Test will pass' {
        1 | Should -BeTrue
    }

    It 'Tests Should -BeTrue: Test will pass' {
        1, 2, 3 | Should -BeTrue
    }

    It 'Tests Should -BeTrue: Test will pass' {
        Get-Process -Name 'Code' -ErrorAction SilentlyContinue | Should -BeTrue
    }

    # Do we need -BeTrue?

    It 'Tests Should -Be Test will pass' {
        $true | Should -Be $true
    }

    It 'Tests Should -BeTrue: Test will pass' {
        1 | Should -Be $true
    }

    It 'Tests Should -BeTrue: Test will pass' {
        1, 2, 3 | Should -Be $true
    }

    It 'Tests Should -BeTrue: Test will pass' {
        Get-Process -Name 'Code' -ErrorAction SilentlyContinue | Should -Be $true
    }

    # Should -BeFalse

    It 'Tests Should -BeFalse: Test will pass' {
        $false | Should -BeFalse
    }

    It 'Tests Should -BeFalse: Test will pass' {
        0 | Should -BeFalse
    }

    It 'Tests Should -BeFalse: Test will pass' {
        $null | Should -BeFalse
    }

    # Not using if here, just picking up the exception
    It 'Tests Should -BeFalse Get-Process -Name 'NotExist': Test will pass' {
        Get-Process -Name 'NotExist' | Should -BeFalse
    }    

    # Should -HaveCount
    # Uses the count property of the object
    It 'Tests Should -HaveCount: Test will pass' {
        1, 2, 3 | Should -HaveCount 3
    }

    $value = 'JimMoyle'

    It 'Tests Should -HaveCount: Test will pass' {
        $value| Should -HaveCount 1
    }

    It 'Tests Should -HaveCount: Test will fail' {
        $notVariable | Should -HaveCount 0
    }

    It 'Tests Should -HaveCount: Test will pass' {
        $notVariable | Should -HaveCount 1
    }

    # https://github.com/pester/Pester/issues/1000

    It 'Tests Should -HaveCount: Test will pass' {
        ($notVariable | Measure-Object).count | Should -Be 0
    }

    # Should -Contain
    # Uses PowerShell's -contains operator.

    It 'Tests Should -Contain: Test will pass' {
        'a', 'b', 'c' | Should -Contain b
    }

    It 'Tests Should -Contain: Test will pass' {
        1..100 | Should -Contain 42
    }

    # Should -Exist    
    # Uses PowerShell's Test-Path Command.

    $actual = (Get-ChildItem . )[0].FullName

    It 'Tests Should -Exist Test will pass' {
        $actual | Should -Exist
    }

    # For Paths with wildcard characters

    It 'Tests Paths with widcards Test will pass' {
        Test-Path -LiteralPath $actual | Should -Be $true
    }


    # Should -Match
    # Uses PowerShell's -match Operator under the hud.
    # Regular Expressions are powerful, but can be confusing, use if you know what you are doing

    It 'Tests -match Test will pass' {
        "I am a value" | Should -Match "I Am"
    }

    It 'Tests -match Test will fail' {
        "I am a value" | Should -Match "I am a bad person"
    }


    # In the docs, there is the following tip......
    # Tip: Use [regex]::Escape("pattern") to match the exact text.
    # If you need to match the exact text, use 'Should -Be'

    

    It 'Tests -match Test will pass' {
        "Greg" | Should -Match ".reg"
    }

    # This passes as . in Regex matches any character.
    # So the 'solution' to this is the following:

    It 'Tests -match Test will fail' {
        "Greg" | Should -Match ([regex]::Escape(".reg"))
    }

    # I'd say in most cases the following would be better:

    It 'Tests -match Test will fail' {
        "Greg" | Should -Be ".reg"
    }






    
    # Should -FileContentMatch  
    # Uses PowerShell's -match Operator under the hud.
    # Don't worry about the 'TestDrive' you see, we'll cover it later

    Set-Content -Path TestDrive:\file.txt -Value 'I am a file'

    It 'Tests Should -FileContentMatch Test will pass' {
        'TestDrive:\file.txt' | Should -FileContentMatch 'I Am'
    }

    It 'Tests Should -FileContentMatch Test will pass' {
        'TestDrive:\file.txt' | Should -FileContentMatch '^I.*file$'
    }

    It 'Tests Should -FileContentMatch Test will fail' {
        'TestDrive:\file.txt' | Should -FileContentMatch 'I Am Not'
    }

    # Should -FileContentMatchExactly
    # Uses PowerShell's -cmatch Operator under the hud.
    # Regular Expressions are *still* powerful, and can still be confusing, use if you know what you are doing
    # I use https://regex101.com/ a lot to help me

    Set-Content -Path TestDrive:\file.txt -Value 'I am a file.'

    It 'Tests Should -FileContentMatchExactly Test will pass' {
        'TestDrive:\file.txt' | Should -FileContentMatchExactly 'I am'
    }

    It 'Tests Should -FileContentMatchExactly Test will fail' {
        'TestDrive:\file.txt' | Should -FileContentMatchExactly 'I Am'
    }

    # Should -FileContentMatchMultiline
    # Uses PowerShell's -match Operator under the hud.
    # Gets the file into a single string rather than an an array of strings by using 'Get-Content $ActualValue -Delimiter ([char]0)'
    # Probably because Get-Content -Raw was introduced in PoSh 3.0
    # Man, if someone asked me to support PoSh 2.0, I'd tell them to take a long walk off a short pier.
    # Remember to enclose the path in quotes, or be an actual file object or PowerShell will try to invoke the path
    # When using FileContentMatchMultiline operator, ^ and $ represent the beginning and end of the whole file, instead of the beginning and end of a line.

    $lineOne = 'I am the first line.'
    $lineTwo = 'I am the second line.'

    Set-Content -Path TestDrive:\file.txt -Value $lineOne
    Add-Content -Path TestDrive:\file.txt -Value $lineTwo

    It 'Tests Should -FileContentMatchMultiline Test will pass' {
        'TestDrive:\file.txt' | Should -FileContentMatchMultiline 'first line\.\r?\nI am'
    }

    It 'Tests Should -FileContentMatchMultiline Test will pass' {
        'TestDrive:\file.txt' | Should -FileContentMatchMultiline '^I am the first.*\n.*second line\.$'
    }

    It 'Tests Should -FileContentMatchMultiline Test will pass' {
        Get-ChildItem -Path TestDrive:\file.txt | Should -FileContentMatchMultiline '^I am the first.*\n.*second line\.$'
    }







    
}
