$packageName = 'gradle'
$version = '4.3.1'
$checksum = '15EBE098CE0392A2D06D252BFF24143CC88C4E963346582C8D88814758D93AC7'
$url = "https://services.gradle.org/distributions/gradle-$version-bin.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
