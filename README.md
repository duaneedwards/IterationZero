# IterationZero
A conventions based continuous integration template for .NET solutions

# Conventions

Project files and solution file must be organised as follows:

- root directory\SolutionName.sln
- root directory\SolutionName\SolutionName.Tests\SolutionName.csproj

# Usage

In Visual Studio, use Nuget Package Manager Console **targeting your Tests project** simply run:

```
Install-Package IterationZero
```

This will install the NUnit, NUnit.Runners, pSake nuget packages if they are missing and create the following files in your root directory:

- Build.bat
- BuildAndPause.bat
- Deploy.bat
- DeployAndPause.bat
- default.ps1 #you psake build file
- Test.bat
- TestAndPause.bat

# Uninstallation

Simply run:

```
Uninstall-Package IterationZero
```
