# 🛡️ LoL Watchdog

A small PowerShell script that keeps an eye on your League of Legends client. If it detects that LoL launched but no game window appeared (a common issue), it kills all related processes and restarts the game for you.

## 💡 Why?

Sometimes League of Legends launches… or so it claims. The processes are there, but nothing shows up on screen. Manually killing and restarting everything is annoying – so this script does it for you.

## 🚀 Features

* Detects zombie LoL processes with no visible window
* Kills all Riot-related processes
* Restarts LoL via the Riot Client with proper launch arguments
* Can run in the background in a loop

## 🔧 Getting Started

### 1. Clone or download this repository

```bash
git clone https://github.com/yourusername/lol-watchdog.git
```

Or just click **Download ZIP** and extract it.

### 2. Open PowerShell as Administrator

Hit `Win + S`, type `powershell`, then right-click → **Run as Administrator**.

### 3. Allow script execution (only once)

Run this command:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Choose `Y` when asked for confirmation.

This lets you run `.ps1` scripts without security warnings.

### 4. Open the script file and adjust the Riot client path

Find this line in `lol_watchdog.ps1`:

```powershell
$riotPath = "D:\Riot Games\Riot Client\RiotClientServices.exe"
```

Change it to your actual Riot installation path if needed.

### 5. Run the watchdog script

Navigate to the folder where the script is located, then run:

```powershell
.\lol_watchdog.ps1
```

Keep it running in the background – it checks for LoL freeze every 10 seconds and restarts if needed.

## ✅ To Do

* [ ] System tray notification when LoL is restarted
* [ ] Logging to file (number of restarts, timestamps)
* [ ] GUI launcher with restart button
* [ ] Auto-start with Windows

## 🧠 Contribute

If this helps you – star it, share it, or drop a PR with an idea. Let’s fix Riot together. 💀

## 📜 License

MIT – use it, improve it, curse at Riot with it.
