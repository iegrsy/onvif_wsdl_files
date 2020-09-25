## Enter Developer PowerShell
$installPath = &"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -version 16.0 -property installationpath
Import-Module (Join-Path $installPath "Common7\Tools\Microsoft.VisualStudio.DevShell.dll")
Enter-VsDevShell -VsInstallPath $installPath -SkipAutomaticLocation

get-childitem "$(pwd)" -recurse | where {$_.extension -eq ".wsdl"} | % {
     $file_path=$_.FullName
     Write-Host $file_path

     powershell.exe ".\wsdl_class_generator.ps1 $file_path"
}