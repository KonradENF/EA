####### The starting point for the script is the bottom #######
$absoluteDir = $PSScriptRoot 

if($args[0]){
 $absoluteDir = $args[0]
}


echo $absoluteDir

if(!(Test-Path -Path $absoluteDir)){ 
   return
}
 

#"C:\Users\kfahrendholz\Documents\GitHub\EA"

$editorDir = $absoluteDir + "\editor"
$guiDir = $absoluteDir + "\gui"
$testDir = $absoluteDir + "\test"

$extDir = $absoluteDir + "\ext"

$gTestDir = $extDir +"\google\gtest"
$gTestDirLib = $gTestDir+"\lib"
$gTestDirInclude = $gTestDir+"\include"

$wxWidgetsDir = $extDir +"\wxwidgets"
$wxWidgetsDirLib = $wxWidgetsDir + "\lib"
$wxWidgetsDirInclude = $wxWidgetsDir + "\include"

$temp = $absoluteDir + "\temp"

$make = "mingw32-make"
$cmake ="cmake"
$git = "git"

$projects = @($editorDir,$guiDir,$testDir)

echo $absoluteDir

cd $absoluteDir

function BuildTest-Command{
  
    Install-Command
    cd $absoluteDir

    echo "Execute Unittest..."

    $proc = Start-Process $make "unittest"  -PassThru -Wait
}

function Install-Command
{    
    CheckPath
    
    Install-GTest
    Install-WxWidgets   
}

function Install-WxWidgets{
    $wxWidgetsPath = $temp + "\wxWidgets"
    New-Item -ItemType directory -Path $wxWidgetsPath -Force | Out-Null
    $wxWidgetsSource = $wxWidgetsPath + "\source.zip"
    
    #(New-Object net.WebClient).DownloadFile('https://github.com/wxWidgets/wxWidgets/archive/v3.0.2.zip',$wxWidgetsSource)
       

    Expand-Archive -Path $wxWidgetsSource -DestinationPath $wxWidgetsPath -Force  
}

function Install-WxWidgets{
    if(!(Test-Path -Path $wxWidgetsDir)){ 
        echo "Install wxWidgets..."
        cd $temp               
                 
        echo "Download..."
        $proc = Start-Process $git "clone https://github.com/wxWidgets/wxWidgets"  -PassThru -Wait

        echo "Make..."
        $wxWidgetsTempPath = $temp+"\wxWidgets"
        $wxWidgetsTempBuildPath = $wxWidgetsTempPath+"\build\msw"

        cd $wxWidgetsTempBuildPath

        $proc = Start-Process $make "-f makefile.gcc BUILD=release SHARED=1 MONOLITHIC=1 UNICODE=1 CXXFLAGS=-std=gnu++11"  -PassThru -Wait  

        cd $wxWidgetsTempPath

        $wxWidgetsTempPathInclude = $wxWidgetsTempPath + "\include"
        $wxWidgetsTempPathLib = $wxWidgetsTempPath + "\lib\gcc_dll\*"

        #New-Item -Path $wxWidgetsTempPathLib -ItemType Directory -Force
        echo "Copy..."

        Copy-Item -path $wxWidgetsTempPathInclude -destination $wxWidgetsDirInclude -recurse -Force
        Copy-Item -path $wxWidgetsTempPathLib -destination $wxWidgetsDirLib -recurse -Force

        cd $temp
        Start-Sleep 5
        

        Remove-Item $wxWidgetsTempPath -recurse -Force 
        
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
        $proc = Start-Process $make -Wait    -PassThru            
   
        
        
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
    $path = @($temp, $editorDir,$guiDir,$testDir,$extDir)
    
    	foreach ($currentPath in $path)
		{            
            if(!(Test-Path -Path $currentPath )){
                echo "Create Path:" $currentPath
                New-Item -ItemType directory -Path $currentPath -Force | Out-Null
            }
        }
}

Install-Command
BuildTest-Command
