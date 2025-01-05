# Define the output file path
$outputFile = "C:\DHCP_Leases.csv"

# Import the DHCP server module (if not already imported)
Import-Module DhcpServer

# Initialize an empty array to store the lease information
$leases = @()

# Get all DHCP scopes
$scopes = Get-DhcpServerv4Scope

# Iterate through each scope and get the leases
foreach ($scope in $scopes) {
    $scopeId = $scope.ScopeId
    $scopeLeases = Get-DhcpServerv4Lease -ScopeId $scopeId
    
    foreach ($lease in $scopeLeases) {
        # Add lease information to the array
        $leases += [PSCustomObject]@{
            ScopeId       = $scopeId
            IPAddress     = $lease.IPAddress
            HostName      = $lease.HostName
            ClientID      = $lease.ClientId
            AddressState  = $lease.AddressState
        }
    }
}

# Export the leases to a CSV file
$leases | Export-Csv -Path $outputFile -NoTypeInformation -Delimiter ";"

# Confirm completion
Write-Host "DHCP leases have been exported to $outputFile"
