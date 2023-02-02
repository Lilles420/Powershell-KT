$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
$csv = Import-csv $dir/MOCK_DATA.csv | Select-Object first_name,last_name,ip_address -skip 1
new-item $dir\ip.txt
$loopcount=0
foreach($ip in $csv){
    $lol= $ip.ip_address
    $enim= $ip.first_name
    $pnim= $ip.last_name
    $tervenim =$enim + " " + $pnim + ","
    $tim= $lol.Split(".")
    $uus = ""
    $count= 0
    
    if ($loopcount -le 99){
    foreach($ipo in $tim)
    {
     $ipo =[int]$ipo
     if ($ipo -ge 0 -and $ipo -le 255){
     $count +=1
     $uus+= [string]$ipo+"."
     }
     else {
     $uus += [string]$ipo+"."
     }
     if ($count -eq 4) {
     $uus = ""
     break
    }
    }
    }
    else{break}
    $count = 0
    
    if ($uus -ne ""){
    $loopcount+=1
    $uus= $uus.TrimEnd(".")
    $ip = $tervenim +$uus
       
    $ip >> $dir\ip.txt}
    write-host $loopcount
}
