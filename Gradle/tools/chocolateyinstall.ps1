$binRoot = Get-BinRoot

$name = 'Gradle'
$version = '2.11'

$gradle_home = Join-Path $binRoot $name
$gradle_bin = Join-Path $gradle_home 'bin'

$url = https://services.gradle.org/distributions/gradle-$version-all.zip

Install-ChocolateyZipPackage $name $url $binRoot

Install-ChocolateyPath $gradle_bin 'User'
