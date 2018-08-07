<#
	===========================================================================
	 Created on:   	2018/08/02
	 Created by:   	Jim Moyle
	 GitHub link: 	https://github.com/JimMoyle/YouTube-Pester-Series
	 Twitter: 		@JimMoyle
	===========================================================================
#>

#Requires -RunAsAdministrator

# Current tested version PoSh and Windows
$psversiontable.PSVersion
Get-ComputerInfo -Property WindowsVersion

# Just in case it's not already done.
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# See if Pester is there by default
Get-Module -ListAvailable -Name Pester

# Can't update it?
Update-Module Pester

# Look for Pester in PSGallery
$moduleInfo = Find-Module -Name Pester

# What does it tell us?
$moduleinfo | Format-List * | more

# Supported powershell version
$moduleInfo.AdditionalMetadata.PowerShellVersion

# Look at documention
Start-Process $moduleinfo.ProjectUri

# Look at PS Gallery
Start-Process 'https://www.powershellgallery.com/packages/Pester/'

# Cert is different from PS Gallery so we need to do some additional parameters
Install-Module -Name Pester -Force -SkipPublisherCheck

# Now you can update the module
Update-Module -Name Pester

# Now what do we see?
Get-Module -ListAvailable -Name Pester

# What does it look like on the filesystem?
Invoke-Item -Path 'C:\Program Files\WindowsPowerShell\Modules\Pester'

# Does Powershell import the righht version?
Import-Module -Name Pester

# Quick look at the commands
Get-Command -Module Pester

# Start creating a function
New-Fixture -Path .\S2E2\New-Fixture -Name 'Test-Me'
