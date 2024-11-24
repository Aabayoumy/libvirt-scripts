
# PowerShell script to optimize Windows 11 performance based on the provided article
# Source https://sysguides.com/install-a-windows-11-virtual-machine-on-kvm#6-16-mount-the-virtio-winiso-image
# Function to disable SuperFetch (SysMain)
function Disable-SuperFetch {
$service = Get-Service -Name "SysMain" -ErrorAction SilentlyContinue
if ($service) {
if ($service.Status -ne 'Stopped') {
Stop-Service -Name "SysMain" -Force
Set-Service -Name "SysMain" -StartupType Disabled
Write-Host "SuperFetch (SysMain) has been disabled."
} else {
Write-Host "SuperFetch (SysMain) is already stopped."
}
} else {
Write-Host "SuperFetch (SysMain) service not found."
}
}

# Function to disable Windows Web Search
function Disable-WebSearch {
$regPath = "HKCU:\Software\Policies\Microsoft\Windows"
$keyName = "Explorer"

# Create the Explorer key if it doesn't exist
if (-not (Test-Path $regPath)) {
New-Item -Path $regPath -Force
}

# Create the Explorer subkey
New-Item -Path "$regPath\$keyName" -Force | Out-Null

# Set the DisableWebSearch DWORD value to 1
Set-ItemProperty -Path "$regPath\$keyName" -Name "DisableWebSearch" -Value 1 -Type DWord
Write-Host "Windows Web Search has been disabled."
}

# Function to disable background apps
function Disable-BackgroundApps {
$backgroundAppsKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"

# Create the key if it doesn't exist
if (-not (Test-Path $backgroundAppsKey)) {
New-Item -Path $backgroundAppsKey -Force | Out-Null
}

# Set the value to 0 to disable background apps
Set-ItemProperty -Path $backgroundAppsKey -Name "GlobalUserDisabled" -Value 1 -Type DWord
Write-Host "Background apps have been disabled."
}

# Execute functions to optimize performance
Disable-SuperFetch
Disable-WebSearch
Disable-BackgroundApps

Write-Host "Windows 11 performance optimization completed."
