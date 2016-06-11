$packageName = 'gradle'
$version = $env:chocolateyPackageVersion
$url = "https://services.gradle.org/distributions/gradle-$version-bin.zip"

$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition
Install-ChocolateyZipPackage $packageName $url $installDir

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
