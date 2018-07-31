$psversiontable.PSVersion

Get-Module -ListAvailable -Name Pester

Find-Module -Name Pester

#Cert is different from PS Gallery
Install-Module -Name Pester -Force -SkipPublisherCheck

Get-Module -ListAvailable -Name Pester

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Import-Module -Name Pester

Get-Command -Module Pester

New-Fixture -Path .\S2E1\New-Fixture -Name 'Test-Me'
