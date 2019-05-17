Describe "TestDrive Scopes" {

    $TestDrive

    New-Item -ItemType File -Path TestDrive:\DescribeScope.txt

    Get-ChildItem TestDrive:\
    
    InModuleScope -ModuleName $sut.TrimEnd('.psm1') {

        # Sessions, modules, and nested prompts are self-contained environments, but they are not child scopes of the global scope in the session.

        $moduleScope = 'Set In Module'


        Context 'Show Context Scope' {

            $contextScope = 'Set In Context'



            It "does something useful" {

                $itScope = 'Set In It'

    

                $true | Should -Be $true
            }
        }
    }
}