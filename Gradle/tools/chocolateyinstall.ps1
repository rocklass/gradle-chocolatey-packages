
[string]$chocoVersion = $(choco --version)
[string]$majorRelease = $chocoVersion.Split('.')[1]
[string]$minorRelease = $chocoVersion.Split('.')[2]
if (-not $majorRelease.Equals("9") -or -not $minorRelease.Equals("9"))
{
    write-host "WARNING: This package has only been tested with Chocolatey 0.9.9" -f "Yellow"
}

$packageName = 'gradle'
$version = $env:chocolateyPackageVersion
$checksum = '39C906941A474444AFBDDC38144ED44166825ACB0A57B0551DDDB04BBF157F80'
$url = "https://services.gradle.org/distributions/gradle-$version-bin.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$gradle_home = Join-Path $installDir "$packageName-$version"
$gradle_bat = Join-Path $gradle_home 'bin/gradle.bat'

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-BinFile -Name 'gradle' -Path $gradle_bat
