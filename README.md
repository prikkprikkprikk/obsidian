# Obsidian Vault

This repository contains regular backups of my personal Obsidian vaults.

## Automated Git Backup

This vault is automatically backed up to a private GitHub repository using a scheduled script.

### Setup Components:

1. **Backup Script**: `backup-vault.sh`
    - Checks for changes using `git status --porcelain`
    - Only commits and pushes if there are actual changes
    - Includes timestamp in commit messages

2. **Automated Scheduling**: `~/Library/LaunchAgents/no.prikkprikkprikk.obsidian.backup.plist`
    - The script lives in a Shortcut app on my Mac, because that's the easiest way to give it access to my iCloud Drive.
    - The Shortcuts app is given full disk access in the System Preferences.
    - Runs hourly using macOS launchd (more reliable than cron on macOS) – see the file `~/Library/LaunchAgents/no.prikkprikkprikk.obsidian.backup.plist` (also in this repo for reference).
    - Logs are output to `~/Library/Logs/obsidian-backup.log`
    - Errors are logged to `~/Library/Logs/obsidian-backup-error.log`

### Managing the Backup Service:

**Load the service:**
```bash
launchctl load ~/Library/LaunchAgents/no.prikkprikkprikk.obsidian.backup.plist
```

**Unload the service:**
```bash
launchctl unload ~/Library/LaunchAgents/no.prikkprikkprikk.obsidian.backup.plist
```

**Start manually (for testing):**
```bash
launchctl start no.prikkprikkprikk.obsidian.backup
```

**Check service status:**
```bash
launchctl list | grep obsidian
```

**Reloading the service:**
Remember to unload the service first, then load it again.

### Viewing Logs:

- Open **Console.app** 
- Navigate to "User Reports" 
- Look for `obsidian-backup.log` and `obsidian-backup-error.log`
- Or view directly: `tail -f ~/Library/Logs/obsidian-backup.log`

### Initial Git Setup:

```bash
cd "/Users/prikkprikkprikk/Library/Mobile Documents/iCloud~md~obsidian"
git init
git add .
git commit -m "Initial commit: Obsidian vault backup"
git remote add origin https://github.com/yourusername/obsidian-vault.git
git push -u origin main
```

The backup will then run automatically every hour, only creating commits when there are actual changes to back up.
