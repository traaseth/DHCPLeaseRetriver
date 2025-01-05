# DHCPLeaseRetriver

This PowerShell script retrieves all current DHCP leases from a specified DHCP server and exports the data to a CSV file.

Features
    Connects to a specified DHCP server.
    Retrieves DHCP leases, including:
    Scope ID
    IP Address
    Host Name
    Client ID
    Address State
  Outputs the data to a CSV file with headers for easy readability.
  
Prerequisites
  Ensure the script is run on a machine with administrative privileges and the required network permissions to query the DHCP server.
  PowerShell 5.1 or later.
  The DHCP server should be accessible from the machine running the script.
  The script must be run with the appropriate user permissions to access the DHCP server.
