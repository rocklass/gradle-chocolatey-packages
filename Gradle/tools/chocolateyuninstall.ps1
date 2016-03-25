$binRoot = Get-BinRoot

$name = 'Gradle'
$version = $env:chocolateyPackageVersion

$extract_path = Join-Path $binRoot $name

Remove-Item $extract_path -Recurse -Force

Install-ChocolateyEnvironmentVariable "GRADLE_HOME" $null 'Machine'

"Please manually remove Gradle ($extract_path) from the PATH environment variable."
