$here = Split-Path -Parent $MyInvocation.MyCommand.Path 
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
$sut = $sut -replace 'ps1', 'psm1'
Import-Module -Name "$here\$sut" -Scope Local -Force

# So far we've only talked about 'It' and 'Describe' blocks, there are two more, 'Context' is the first we will talk about 

Describe "Context Block Demo" {

    # As with the other Pester commands - 'Describe' and 'It' etc Context takes -Name and -Fixture Parameters, 
    #   but these are almost always used positionally.
    Context -Name 'Demo Context' -Fixture {

        # Provides logical grouping of It blocks within a single Describe block. 

        It 'Demo it block' {
            $true | Should -Be $true
        }
    }

    # Adam Bertrand states in his book on Pester that a good way to use context blocks is to logically separate testing areas
    Context 'Input' {
        # Pipeline, Position etc.
    }
    Context 'Execution' {
        # Code Logic
    }
    Context 'Output' {
        # Properties, Values, Types
    }

    # You can also use context blocks to keep scopes separate for Mocking and the TestDrive (covered in a later episode)
 
}