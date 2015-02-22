$destinationDirectory = "C:\localnugetrepo"
Remove-Item $destinationDirectory\*.nupkg
nuget pack
robocopy . *.nupkg $destinationDirectory