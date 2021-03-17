$packageName = 'gradle'
$version = '6.8.3'
$checksum = '9AF5C8E7E2CD1A3B0F694A4AC262B9F38C75262E74A9E8B5101AF302A6BEADD7'
$url = "https://services.gradle.org/distributions/gradle-$version-all.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
