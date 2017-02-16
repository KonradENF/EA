####### The starting point for the script is the bottom #######
$absoluteDir = $PSScriptRoot 

if($args[0]){
 $absoluteDir = $args[0]
}


echo $absoluteDir
echo $args[0]


if(!(Test-Path -Path $absoluteDir)){ 
   echo $absoluteDir + "Pass not exist"
   exit
}
 

#"C:\Users\kfahrendholz\Documents\GitHub\EA"

$editorDir = $absoluteDir + "\editor"
$guiDir = $absoluteDir + "\gui"
$testDir = $absoluteDir + "\test"
$editorTestDir = $testDir + "\editor"
$editorTestObjDir = $editorTestDir + "\obj"

$testResultDir = $testDir + "\result"

$extDir = $absoluteDir + "\ext"

$gTestDir = $extDir +"\google\gtest"
$gTestDirLib = $gTestDir+"\lib"
$gTestDirInclude = $gTestDir+"\include"

$wxWidgetsDir = $extDir +"\wxwidgets"
$wxWidgetsDirLib = $wxWidgetsDir + "\lib"
$wxWidgetsDirInclude = $wxWidgetsDir + "\include"
$wxWidgetsDll = "wxmsw311u_gcc_custom.dll"

$temp = $absoluteDir + "\temp"

$make = "mingw32-make"
$cmake ="cmake"
$git = "git.exe"
$python ="python.exe"

$projects = @($editorDir,$guiDir,$testDir)

echo $absoluteDir

cd $absoluteDir



function BuildTest-Command{
    cd $absoluteDir
    echo "Execute Unittest..."

    $proc = Start-Process $make "unittest"  -PassThru -Wait
}

function BuildEditor-Command{
	MakeCommand("editor")
}

function MakeCommand($programm){
    cd $absoluteDir
    echo "Make build"$programm
    $command = $programm + " -j4"
	$proc = Start-Process $make $command  -PassThru -Wait
		
}

function BuildGui-Command{
    MakeCommand("gui")
}

function Install-Command
{    
    CheckPath
    
    Install-GTest
    Install-WxWidgets   
}

function Install-WxWidgets{
    if(!(Test-Path -Path $wxWidgetsDir)){ 
        echo "Install wxWidgets..."
        cd $temp               
                 
        echo "Download..."
        #$proc = Start-Process $git "clone https://github.com/wxWidgets/wxWidgets"  -PassThru -Wait

        echo "Make..."
        $wxWidgetsTempPath = $temp+"\wxWidgets"
        $wxWidgetsTempBuildPath = $wxWidgetsTempPath+"\build\msw"

        cd $wxWidgetsTempBuildPath

        $proc = Start-Process $make "-j4 -f makefile.gcc  BUILD=release SHARED=1 MONOLITHIC=1 UNICODE=1 CXXFLAGS=-std=gnu++11"  -PassThru -Wait  

        cd $wxWidgetsTempPath

        $wxWidgetsTempPathInclude = $wxWidgetsTempPath + "\include"
        $wxWidgetsTempPathLib = $wxWidgetsTempPath + "\lib\gcc_dll\*"

        #New-Item -Path $wxWidgetsTempPathLib -ItemType Directory -Force
        echo "Copy..."

        Copy-Item -path $wxWidgetsTempPathInclude -destination $wxWidgetsDirInclude -recurse -Force
        Copy-Item -path $wxWidgetsTempPathLib -destination $wxWidgetsDirLib -recurse -Force

        cd $temp
        Start-Sleep 5
        

        #Remove-Item $wxWidgetsTempPath -recurse -Force 
        
        echo "wxWidgets successful installed"
    }
}



function Install-GTest{
  ##### GOOGLE TEST ####
    
    if(!(Test-Path -Path $gTestDir)){ 
        $googlePath = $temp + "\googletest"   
        echo "Install GTest..."
        cd $temp
                
        $gtestPathTemp = $googlePath + "\googletest"      
                
        echo "Download..."
        $proc = Start-Process $git "clone https://github.com/google/googletest" -NoNewWindow -PassThru -Wait
        cd $gtestPathTemp
        
        echo "CMake..."
        $command = "-G `"MinGW Makefiles`" -DCMAKE_CXX_FLAGS:STRING=`"-DWINVER=0x0500`" ."
        $proc = Start-Process $cmake $command -NoNewWindow -PassThru -Wait
        echo "Make..."

        $command = "-j4"
        $proc = Start-Process $make $command -Wait    -PassThru            
   
        
        
        echo "Copy..."
        New-Item -ItemType directory -Path $gTestDirLib -Force | Out-Null
        $gtestLibMain = $gtestPathTemp +"\libgtest_main.a"
        $gtestLib = $gtestPathTemp +"\libgtest.a"
        Copy-Item -path $gtestLibMain -destination $gTestDirLib 
        Copy-Item -path $gtestLib -destination $gTestDirLib
        
        $gtestPathTempInclude = $gtestPathTemp +"\include\*"

        $aim = $gTestDirInclude+"\gtest"
        Copy-Item -path $gtestPathTempInclude -destination $aim -recurse -Force
        
        cd $temp
        Start-Sleep 3
        
        Remove-Item $googlePath -recurse -Force 
        
        echo "GTest successful installed"
        }
}

function CheckPath
{
    $path = @($temp, $editorDir,$guiDir,$testDir,$editorTestDir, $editorTestObjDir,$testResultDir,$extDir)
    
    	foreach ($currentPath in $path)
		{            
            if(!(Test-Path -Path $currentPath )){
                echo "Create Path:" $currentPath
                New-Item -ItemType directory -Path $currentPath -Force | Out-Null
            }
        }

        $guiWxWidgetsDll = $guiDir+"/"+$wxWidgetsDll
        $source = $wxWidgetsDirLib+"/"+$wxWidgetsDll
             
        if(!(Get-Item $guiWxWidgetsDll -ErrorAction SilentlyContinue)){
            #If item exist
            if(Get-Item $source -ErrorAction SilentlyContinue){
                Copy-Item -path $source -destination $guiDir 
            }
        }
        
}

function Check-SystemPath{
    $requirement = @($make, $cmake,$git, $python)
    $requirement = @($make, $cmake,$git)
    foreach ($currentRequirement in $requirement)
    {
            if (!(Get-Command $currentRequirement -ErrorAction SilentlyContinue)) 
            { 
                echo "ERROR"$currentRequirement" not found ..."
                exit
            }
    } 

}
CheckPath
BuildGui-Command
#Install-WxWidgets

#Install-WxWidgets
