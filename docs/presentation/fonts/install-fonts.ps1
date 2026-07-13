# Install the Latin Modern fonts required by presentation.pptx (current user,
# no admin needed). Run once on any machine before opening the PPTX.
$src = $PSScriptRoot
$dst = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
$reg = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts"
New-Item -ItemType Directory -Force $dst | Out-Null
if (-not (Test-Path $reg)) { New-Item -Path $reg -Force | Out-Null }

Get-ChildItem "$src\*.otf" | ForEach-Object {
    Copy-Item $_.FullName "$dst\$($_.Name)" -Force
    New-ItemProperty -Path $reg -Name "$($_.BaseName) (OpenType)" `
        -Value "$dst\$($_.Name)" -PropertyType String -Force | Out-Null
    Write-Output "installed: $($_.Name)"
}

Add-Type -TypeDefinition 'using System.Runtime.InteropServices; public class FontRefresh { [DllImport("gdi32.dll")] public static extern int AddFontResource(string f); [DllImport("user32.dll")] public static extern int SendMessage(int h, int m, int w, int l); }'
Get-ChildItem "$dst\*.otf" | ForEach-Object { [FontRefresh]::AddFontResource($_.FullName) | Out-Null }
[FontRefresh]::SendMessage(0xffff, 0x001D, 0, 0) | Out-Null
Write-Output "done - font cache refreshed (restart PowerPoint if it was open)"
