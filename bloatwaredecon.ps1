If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Ce script doit être exécuté avec les droits administrateur. Relance en cours..."

    $arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    Start-Process powershell -Verb RunAs -ArgumentList $arguments
    Exit
}

$apps = @(
    "*Microsoft.3DBuilder*",
    "*Microsoft.BingWeather*",
    "*Microsoft.GetHelp*",
    "*Microsoft.Getstarted*",
    "*Microsoft.Messaging*",
    "*Microsoft.Microsoft3DViewer*",
    "*Microsoft.MicrosoftOfficeHub*",
    "*Microsoft.MicrosoftSolitaireCollection*",
    "*Microsoft.MicrosoftStickyNotes*",
    "*Microsoft.MixedReality.Portal*",
    "*Microsoft.Office.OneNote*",
    "*Microsoft.OneConnect*",
    "*Microsoft.People*",
    "*Microsoft.Print3D*",
    "*Microsoft.SkypeApp*",
    "*Microsoft.Todos*",
    "*Microsoft.Wallet*",
    "*Microsoft.WindowsAlarms*",
    "*Microsoft.WindowsCamera*",
    "*microsoft.windowscommunicationsapps*",
    "*Microsoft.WindowsFeedbackHub*",
    "*Microsoft.Xbox.TCUI*",
    "*Microsoft.XboxApp*",
    "*Microsoft.XboxGameOverlay*",
    "*Microsoft.XboxGamingOverlay*",
    "*Microsoft.XboxIdentityProvider*",
    "*Microsoft.XboxSpeechToTextOverlay*",
    "*Microsoft.ZuneMusic*",
    "*Microsoft.ZuneVideo*",
    "*Microsoft.WindowsMaps*"
)

foreach ($app in $apps) {
    Write-Host "To the bin for : $app"
    Get-AppxPackage -Name $app | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -AllUsers -Name $app | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
}

Write-Host "`nMcAfee..."
$mcafee = Get-WmiObject -Class Win32_Product | Where-Object {
    $_.Name -like "*McAfee*"
}

if ($mcafee) {
    foreach ($m in $mcafee) {
        Write-Host "Dégage $($m.Name)..."
        $m.Uninstall() | Out-Null
    }
} else {
    Write-Host "No McAfee found."
}