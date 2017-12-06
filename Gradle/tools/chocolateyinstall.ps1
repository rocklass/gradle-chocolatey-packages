$packageName = 'gradle'
$version = '4.4'
$checksum = 'FA4873AE2C7F5E8C02EC6948BA95848CEDCED6134772A0169718EADCB39E0A2F'
$url = "https://services.gradle.org/distributions/gradle-$version-bin.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
