$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$functionType = $here.split('\')[-1]
$moduleRoot = $here | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$moduleRoot\Functions\$functionType\$sut"

Describe $sut.TrimEnd('ps1') -Tag $functionType {
 
        It "Tests Output" {

            Show-PrivateFunction 'TestMe' | Should -Be "Private Function TestMe"
            
        }
}