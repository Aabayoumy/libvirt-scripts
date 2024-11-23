$WindowTitle = $host.UI.RawUI.WindowTitle
if (-not $env:ChocolateyInstall)  {
    iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
    refreshenv
    $ChocoCachePath = "c:\ProgramData\chocolatey"
    New-Item -Path $ChocoCachePath -ItemType Directory -Force
    choco --cacheLocation="$ChocoCachePath"
    choco feature enable -n=allowGlobalConfirmation
}

## List of apps to be installed
$apps = "vlc", "windirstat", "7zip", "vscode", "choco-cleaner", "dust", "microsoft-windows-terminal", "pwsh", "nerd-fonts-JetBrainsMono", "nerd-fonts-FiraCode" , "nerd-fonts-Hack"
foreach($app in $apps) {
    $host.UI.RawUI.WindowTitle = "$WindowTitle : Install $app" 
    cinst -y  --limit-output  --no-progress $app 
}


$host.UI.RawUI.WindowTitle = $WindowTitle

choco-cleaner

