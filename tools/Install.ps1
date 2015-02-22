param($installPath, $toolsPath, $package, $project)
$projectFullName = $project.FullName
$debugString = "install.ps1 executing for " + $projectFullName
Write-Host $debugString
 
$fileInfo = new-object -typename System.IO.FileInfo -ArgumentList $projectFullName
$projectDirectory = $fileInfo.DirectoryName
$tempDirectory = "iterationzero"
$sourceDirectory = "$projectDirectory\$tempDirectory"
Write-Host $sourceDirectory
 
$destinationDirectory = "$projectDirectory\.."
Write-Host $destinationDirectory
 
if (test-path $sourceDirectory -pathtype container)
{
 Write-Host "Copying files from $sourceDirectory to $destinationDirectory"
 robocopy $sourceDirectory $destinationDirectory /XO
 
 Write-Host "Removing $tempDirectory from project."
 $tempDirectoryProjectItem = $project.ProjectItems.Item($tempDirectory)
 $tempDirectoryProjectItem.Remove()
 
 Write-Host "Deleting $sourceDirectory"
 remove-item $sourceDirectory -recurse
}

# try to set the default project to build
$buildFile = "$destinationDirectory\default.ps1"
$projectName = $project.Name
$projectName = $projectName -replace ".Tests", ""
(Get-Content $buildFile) -replace 'placeholderproject', $projectName | Out-File $buildFile
 
$debugString = "install.ps1 complete " + $projectFullName
Write-Host $debugString

# sourced from ryan vice: http://www.vicesoftware.com/nuget/creating-a-nuget-package-that-will-install-files-relative-to-the-solution/