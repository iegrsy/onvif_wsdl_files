## Enter Developer PowerShell
# $installPath = &"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -version 16.0 -property installationpath
# Import-Module (Join-Path $installPath "Common7\Tools\Microsoft.VisualStudio.DevShell.dll")
# Enter-VsDevShell -VsInstallPath $installPath -SkipAutomaticLocation

$input_file=$args[0]
$wsdl_file_path="$input_file"

write-host Generating $wsdl_file_path

[System.IO.FileInfo]$path = $wsdl_file_path

$classPath = Split-Path -Path $path

$classOut=$path.BaseName
$classNamespace=$path.BaseName

wsdl.exe file://$wsdl_file_path /o:$classPath\$classOut.cs /n:O$classNamespace