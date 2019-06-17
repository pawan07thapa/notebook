write-host "Use systeminfo in a script which calculates how long this system has been up in minutes and seconds.
You must use systeminfo, and send its output to a temporary file.
Then, as part of the script, read from that file, get the boot time, and compare with the time now."
write-host " "

write-host "Writing Information to temp12_output.txt"
systeminfo | out-file ".\temp12_output.txt"
write-host " "

write-host "Loading Information from temp12_output.txt"
$info = get-content -path .\temp12_output.txt 
write-host " "

write-host "Searching for system boot time"
$boot_time_info = $info | where-object {$_ -like "*System Boot Time*"}
$boot_time_info
write-host " "

write-host "Extracting boot time"
$boot_info = $boot_time_info.Substring(27)
$boot_info
write-host " "

write-host "Today's date"
$today = Get-Date
$today
write-host " "

write-host "Finding time-span"
$time_span = new-timespan -start $boot_info -end $today
$time_span

write-host "Up and running for"($time_span.Days)"Days,"($time_span.Hours)"Hours,"($time_span.Minutes)"Minutes and"($time_span.Seconds)"Seconds"