Add-PSSnapin -Name VeeamPSSnapIn -ErrorAction SilentlyContinue
Connect-VBRServer


function DiscoveryJobs() {
    $out = @()
    $jobs_name = @{}
    $jobs = Get-VBRJob -WarningAction Ignore | Select-Object name 
    foreach ($job in $jobs) {
        $value = $job.Name
        $key = "{#BKNAME}"

        $key_value = @{$key = $value}
        $out += $key_value
        
    }
    $out = $out | ConvertTo-Json
    $out

}

DiscoveryJobs
Disconnect-VBRServer
