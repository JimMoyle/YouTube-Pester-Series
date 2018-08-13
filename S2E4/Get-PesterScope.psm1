function Show-PublicFuction {
    [CmdletBinding(PositionalBinding=$true)]

    Param (
        [Parameter(
            ValuefromPipelineByPropertyName = $true,
            ValuefromPipeline = $true,
            Mandatory = $true
        )]
        [System.String]$StringVar
    )

    BEGIN {
        Set-StrictMode -Version Latest
    } # Begin
    PROCESS {
        Write-Output "Public Function $StringVar"
    } #Process
    END {} #End
}  #function Show-PublicFuction

function Show-PrivateFuction {
    [CmdletBinding(PositionalBinding = $true)]

    Param (
        [Parameter(
            ValuefromPipelineByPropertyName = $true,
            ValuefromPipeline = $true,
            Mandatory = $true
        )]
        [System.String]$StringVar
    )

    BEGIN {
        Set-StrictMode -Version Latest
    } # Begin
    PROCESS {
        Write-Output "Private Function $StringVar"
    } #Process
    END {} #End
}  #function Show-PrivateFuction

Export-ModuleMember -Function Show-PublicFuction