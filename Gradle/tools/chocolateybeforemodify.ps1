
$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation   = Join-Path $toolsDir "$packageName-$packageVersion"

Remove-Item $fileLocation -Recurse -Force
