$here = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
$sut = $sut -replace 'ps1', 'psm1'
Import-Module -Name "$here\$sut" -Scope Local -Force

Describe "Get-Module Scope" {

    # As with the other Pester commands - 'Describe' and 'It' etc Context takes -Name and -Fixture Parameters, 
    #   but these are almost always used positionally.
    Context -Name 'Demo Context' -Fixture {

        #Provides logical grouping of It blocks within a single Describe block. 

        It 'Demo it block' {
            $true | Should -Be $true
        }
    }
 
    InModuleScope -ModuleName $sut.TrimEnd('.psm1') {

        It 'Demo it block' {
            $true | Should -Be $true
        }
        
    }
}