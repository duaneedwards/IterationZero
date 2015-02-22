properties {
    $projectName = "placeholderproject"
    $testProjectName = "$projectName.Tests"
    $unitTestAssembly = "$testProjectName.dll"
    $projectConfig = "Release"
    $base_dir = resolve-path .\
    $test_dir = "$base_dir\$testProjectName\bin\$projectConfig"
    $nunitPath = "$base_dir\packages\NUnit.Runners.2.6.4\tools"
}

Task Default -depends Build

Task Clean {
	Remove-Item *.nupkg
}

Task Build -depends Clean {
	Write-Host "$projectName" -ForegroundColor Green
	Exec { msbuild "$projectName.sln" /t:Build /p:Configuration=$projectConfig /v:quiet} 
}

task Test {
	exec {
		& $nunitPath\nunit-console.exe $test_dir\$unitTestAssembly /nologo /nodots /xml=$base_dir\TestResult.xml
	}
}

Task Package -depends Build {
	Exec { .nuget\nuget pack \$projectName.nuspec }
}

Task Deploy -depends Package {
	Exec { .nuget\nuget push *.nupkg }
}