$here = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
$sut = $sut -replace 'ps1', 'psm1'
Import-Module -Name "$here\$sut" -Scope Local -Force

Describe "Get-PesterScope" {

    # PowerShell Scopes protect access to variables, aliases, functions, and PowerShell drives (PSDrives) by limiting where they can be read and changed.

    It "does something useful" {
        $true | Should -Be $true
    }
}


Describe "Get-PesterScopeTwo" {

    $describeScope = 'Set In Describe'

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

Write-Output $here
Write-Output $sut
Write-Output $describeScope
Write-Output $moduleScope
Write-Output $contextScope
Write-Output $itScope