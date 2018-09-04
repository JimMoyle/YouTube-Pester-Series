function Show-PrivateFunction {
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