$packageName = 'gradle'
$version = '5.0'
$checksum = '6157AC9F3410BC63644625B3B3E9E96C963AFD7910AE0697792DB57813EE79A6'
$url = "https://services.gradle.org/distributions/gradle-$version-bin.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
