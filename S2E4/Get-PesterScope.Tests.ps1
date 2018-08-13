$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Get-PesterScope" {

    # PowerShell Scopes protect access to variables, aliases, functions, and PowerShell drives (PSDrives) by limiting where they can be read and changed.

    It "does something useful" {
        $true | Should -Be $true
    }
}


Describe "Get-PesterScope" {

    
    $describeScope = 'Set In Describe'
    
    

    InModuleScope -ModuleName 'Blah' {

        # Sessions, modules, and nested prompts are self-contained environments, but they are not child scopes of the global scope in the session.
        Get-Variable -Scope local # No $here or $sut

        $moduleScope = 'Set In Module'

        Context {

            $contextScope = 'Set In Context'

            It "does something useful" {

                $itScope = 'Set In It'

                Get-Variable -Scope local # No $here or $sut

                $true | Should -Be $true
            }
        }
    }
}
