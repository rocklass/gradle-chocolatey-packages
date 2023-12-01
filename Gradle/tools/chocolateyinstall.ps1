$packageName = 'gradle'
$version = '8.5'
$checksum = 'C16D517B50DD28B3F5838F0E844B7520B8F1EB610F2F29DE7E4E04A1B7C9C79B'
$url = "https://services.gradle.org/distributions/gradle-$version-all.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
