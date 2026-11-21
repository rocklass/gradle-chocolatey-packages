$packageName = 'gradle'
$version = '9.9.2'
$checksum = '1ac85e9cbc2b091ad04e6c6d0f486f0a2a2fabd78f9f8719a0d5bcc0ce1b345b'
$url = "https://services.gradle.org/distributions/gradle-$version-all.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
