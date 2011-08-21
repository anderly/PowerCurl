param($installPath, $toolsPath, $package)

Import-Module(Join-Path, $toolsPath, PowerCurl.psm1)

set-alias curl powercurl
set-alias pc powercurl