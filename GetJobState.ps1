Add-PSSnapin -Name VeeamPSSnapIn -ErrorAction SilentlyContinue
Connect-VBRServer

function GetJobStatus($job){
    $jobs = Get-VBRJob -WarningAction Ignore | Where-Object {$_.Name -eq $job}
    if ($jobs.GetLastResult() -eq "Success") {
        return 1
    } elif (($jobs.GetLastResult() -eq "Warning") -or ($jobs.GetLastResult() -eq "None")) {
        return 2
    } else {
        return 0
    }
    
}


GetJobStatus $args[0]
Disconnect-VBRServer
