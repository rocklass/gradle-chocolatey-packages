$packageName = 'gradle'
$version = '8.14'
$checksum = 'efe9a3d147d948d7528a9887fa35abcf24ca1a43ad06439996490f77569b02d1'
$url = "https://services.gradle.org/distributions/gradle-$version-all.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
