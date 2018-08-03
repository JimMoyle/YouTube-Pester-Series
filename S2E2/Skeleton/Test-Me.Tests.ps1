#What do $here and $sut do?

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

#describe sets up a scope for the tests to run in
Describe "Test-Me" {
    #It blocks are a single test within describe scope, can have many It tests within a Describe scope
    It "does something useful" {
        #Should is the assertion within an It block, can have many, but probably not a good idea
        #A failing test will throw an exception
        #If any exception occurs within an It block the test will fail
        #$true | Should -Be $false

        #See what a passing test looks like
        $true | Should -Be $true
    }
}
