$packageName = 'gradle'
$version = '6.2.2'
$checksum = '838FA0E3373A9C8D953EFF972449EDC6BE5FA12B26509AC3387727DE85138CC0'
$url = "https://services.gradle.org/distributions/gradle-$version-all.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
