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

        Write-Output "Public Function $StringVar"

}

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

        Write-Output "Private Function $StringVar"

}

Export-ModuleMember -Function Show-PublicFuction