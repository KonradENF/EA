####### The starting point for the script is the bottom #######
$absoluteDir = $PSScriptRoot 

if($args[0]){
 $absoluteDir = $args[0]
}


echo $absoluteDir
echo $args[0]


if(!(Test-Path -Path $absoluteDir)){ 
   exit
}
 

function Clear-Workspace{
$exclude = $extDir + "*"

Get-ChildItem -Path  $absoluteDir -Recurse |
Select -ExpandProperty FullName |
Where {$_ -notlike $exclude} |
sort length -Descending |
Remove-Item -force 
}

Clear-Workspace
