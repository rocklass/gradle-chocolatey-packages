$binRoot = Get-BinRoot

$name = 'Gradle'
$version = $env:chocolateyPackageVersion

$extract_path = Join-Path $binRoot "$($name)-$version"

$gradle_home = Join-Path $binRoot $name
$gradle_bin = Join-Path $gradle_home 'bin'

$url = "https://services.gradle.org/distributions/gradle-$version-bin.zip"

Install-ChocolateyZipPackage $name $url $binRoot

Rename-Item $extract_path $name

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $gradle_home 'Machine'
Install-ChocolateyPath $gradle_bin 'Machine'
