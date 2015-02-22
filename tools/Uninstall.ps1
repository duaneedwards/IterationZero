param($installPath, $toolsPath, $package, $project)
$projectFullName = $project.FullName
$debugString = "Uninstall.ps1 executing for " + $projectFullName
Write-Host $debugString

$fileInfo = new-object -typename System.IO.FileInfo -ArgumentList $projectFullName
$projectDirectory = $fileInfo.DirectoryName
$destinationDirectory = "$projectDirectory\.."
Write-Host "Deleting IterationZero files from " + $destinationDirectory
remove-item $destinationDirectory\Build.bat
remove-item $destinationDirectory\BuildAndPause.bat
remove-item $destinationDirectory\default.ps1
remove-item $destinationDirectory\Deploy.bat
remove-item $destinationDirectory\DeployAndPause.bat
remove-item $destinationDirectory\Test.bat
remove-item $destinationDirectory\TestAndPause.bat
 
$debugString = "Uninstall.ps1 complete for " + $projectFullName
Write-Host $debugString