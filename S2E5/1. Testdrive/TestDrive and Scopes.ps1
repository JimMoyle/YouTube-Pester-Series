Describe "TestDrive Scopes" {

    $TestDrive

    New-Item -ItemType File -Path TestDrive:\DescribeScope.txt

    Get-ChildItem TestDrive:\

    Write-Output $null
    
    InModuleScope -ModuleName $sut.TrimEnd('.psm1') {

        # Sessions, modules, and nested prompts are self-contained environments, but they are not child scopes of the global scope in the session.

        $moduleScope = 'Set In Module'

        Write-Output $null

        Context 'Show Context Scope' {

            $contextScope = 'Set In Context'

            Write-Output $null

            It "does something useful" {

                $itScope = 'Set In It'

                Write-Output $null

                $true | Should -Be $true
            }
        }
    }
}