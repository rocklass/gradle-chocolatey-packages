$packageName = 'gradle'
$version = '8.13'

$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $null 'Machine'
Uninstall-BinFile -Name 'gradle' -Path $gradle_bat
