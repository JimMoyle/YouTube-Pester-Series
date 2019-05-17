$here = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
$sut = $sut -replace 'ps1', 'psm1'
# Instead of dot sourcing a function, we'll import the module
Import-Module -Name "$here\$sut" -Scope Local -Force

# Now let's look at how module functions can be tested and demonstrate scopes

Describe "Pester Scopes" {

    $describeScope = 'Set In Describe'

    #You can do InModuleScope before describe, and some docs show that, but I don't like it as it removes functionality from describe (tags)

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