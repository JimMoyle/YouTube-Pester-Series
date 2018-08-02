<#
	===========================================================================
	 Created on:   	2017/03/10
	 Created by:   	Jim Moyle
	 GitHub link: 	https://github.com/JimMoyle/YouTube-Pester-Series
	 Twitter: 		@JimMoyle
	===========================================================================
#>

# Current tested version and pre-reqs
$psversiontable.PSVersion

#See if Pester is there by default
Get-Module -ListAvailable -Name Pester

#Look for Pester in PSGallery
Find-Module -Name Pester

#Cert is different from PS Gallery so we need to do some additional parameters
Install-Module -Name Pester -Force -SkipPublisherCheck

#Now what do we see?
Get-Module -ListAvailable -Name Pester

#Just in case it's not already done.
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

#Does Powershell import the righhtr version?
Import-Module -Name Pester

#Quick look at the commands
Get-Command -Module Pester

#Start creating a function
New-Fixture -Path .\S2E1\New-Fixture -Name 'Test-Me'
