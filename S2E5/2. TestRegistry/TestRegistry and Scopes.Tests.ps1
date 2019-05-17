Describe "TestRegistry Scopes" {

    $testRegistry

    New-Item -Path TestRegistry:\ -Name Describe
 
    It 'Should have a Describe Key' {
        Test-Path TestRegistry:\Describe | Should -Be true
    }
    
    Context 'TestRegistry1' {
        
        New-Item -Path TestRegistry:\ -Name Context1

        It 'Should have a Describe key' {
            Test-Path TestRegistry:\Describe | Should -Be true
        }

        It 'Should have a Context1 key' {
            Test-Path TestRegistry:\Context1 | Should -Be true
        }
    }

    Context 'TestRegistry2' {
        
        New-Item -Path TestRegistry:\ -Name Context2

        It 'Should have a describe scope key' {
            Test-Path TestRegistry:\Describe | Should -Be true
        }

        It 'Should not have a Context1 key' {
            Test-Path TestRegistry:\Context1 | Should -Be false
        }

        It 'Should have a Context2 key' {
            Test-Path TestRegistry:\Context2 | Should -Be true
        }
    }

    Context 'TestRegistry manipulation' {
        
        Rename-Item TestRegistry:\Describe Renamed

        It 'Should have renamed the key' {         
            Test-Path TestRegistry:\Renamed | Should -Be true
        }
    }

    It 'Should NOT have a describe scope key' {
        Test-Path TestRegistry:\Describe | Should -Be false
    }

    It 'Should NOT have a renamed key' {  
        Test-Path TestRegistry:\Renamed | Should -Be false
    }
}