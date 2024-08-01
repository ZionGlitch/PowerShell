"******************************************************************************************"
"Batch Test Connection Script in Powershell"
"Author: Sven Kasaroczky"
"------------------------------------------------------------------------------------------"
"Please type or paste the file path for your CSV file"
"For Example: `"C:\Users\john.doe2\Documents\Scripts\ip_port.csv`""
"******************************************************************************************"
$csv_path = Read-Host -Prompt "Enter file path"

$csv = Import-Csv -Path "$csv_path" 

$ips   = $csv.IP | where-object { $_ }
$ports = $csv.Port | where-object { $_ }

foreach( $ip in $ips )
{
    foreach( $port in $ports )
    {

        "{0} = {1}" -f $ip, $port
        Test-NetConnection -ComputerName $ip -Port $port -InformationLevel Detailed

    }
}
