# 🛡️ LoL Watchdog

A small PowerShell script that keeps an eye on your League of Legends client. If it detects that LoL launched but no game window appeared (a common issue), it kills all related processes and restarts the game for you.

## 💡 Why?

Sometimes League of Legends launches… or so it claims. The processes are there, but nothing shows up on screen. Manually killing and restarting everything is annoying – so this script does it for you.

## 🚀 Features

- Detects zombie LoL processes with no visible window
- Kills all Riot-related processes
- Restarts LoL via the Riot Client with proper launch arguments
- Can run in the background in a loop

## 🔧 Usage

1. Clone the repo or download the `.ps1` files
2. Edit the Riot Client path in the script if needed:
   ```powershell
   $riotPath = "D:\Riot Games\Riot Client\RiotClientServices.exe"
