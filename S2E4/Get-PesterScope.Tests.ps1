$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Get-PesterScope" {

    # PowerShell Scopes protect access to variables, aliases, functions, and PowerShell drives (PSDrives) by limiting where they can be read and changed.

    It "does something useful" {
        $true | Should -Be $true
    }


}


InModuleScope -ModuleName 'Blah' {

    # Sessions, modules, and nested prompts are self-contained environments, but they are not child scopes of the global scope in the session.

    Get-Variable -Scope local # No $here or $sut

    
    Describe "Get-PesterScope" {

        

        It "does something useful" {
            $true | Should -Be $true
        }
    }
}
