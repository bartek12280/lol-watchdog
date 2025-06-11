# LoL Watchdog

# Riot Client executable path (change this if LoL is installed elsewhere)
$riotPath = "D:\Riot Games\Riot Client\RiotClientServices.exe"
$riotArgs = "--launch-product=league_of_legends --launch-patchline=live"

# List of known LoL-related processes
$lolProcesses = @(
    "LeagueClient",
    "LeagueClientUx",
    "LeagueClientUxRender",
    "RiotClientServices",
    "RiotClientCrashHandler",
    "LoLClient",
    "GameClient",
    "League of Legends"
)

# Endless loop to monitor the game
while ($true) {
    $isLoLRunning = $false
    $hasLoLWindow = $false

    # Check if any of the processes are running
    foreach ($proc in $lolProcesses) {
        if (Get-Process -Name $proc -ErrorAction SilentlyContinue) {
            $isLoLRunning = $true
            break
        }
    }

    # If processes are found, check if a game window exists
    if ($isLoLRunning) {
        $hasLoLWindow = Get-Process | Where-Object { $_.MainWindowTitle -like "*League of Legends*" }

        if (-not $hasLoLWindow) {
            Write-Host "`n[!] LoL is running but no window was found. Restarting..."

            foreach ($proc in $lolProcesses) {
                Get-Process -Name $proc -ErrorAction SilentlyContinue | Stop-Process -Force
            }

            Start-Sleep -Seconds 3

            if (Test-Path $riotPath) {
                Start-Process -FilePath $riotPath -ArgumentList $riotArgs
                Write-Host "[✔] LoL restarted via RiotClientServices.exe"
            } else {
                Write-Host "[X] Riot client path not found: $riotPath"
            }
        } else {
            Write-Host "[OK] LoL is running with a window – all good."
        }
    } else {
        Write-Host "[...] LoL is not running – waiting..."
    }

    Start-Sleep -Seconds 10
}
