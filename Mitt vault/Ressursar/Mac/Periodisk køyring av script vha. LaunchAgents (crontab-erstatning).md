
På grunn av macOS sine restriksjonar på tilgong til filer, kan ikkje LaunchAgents køyre bash-script direkte.

Difor har eg i staden laga Shortcuts som køyrer script indirekte.

## Obsidian Git Backup

Har laga script i Shortcut-appen:
```bash
# Obsidian Vault Auto-Backup Script
# =================================
# Note: This is a copy of the script; it resides in a Shortcut called "Obsidian Git Backup".

cd "/Users/prikkprikkprikk/Obsidian" || exit 1

echo "$(date): git status:"

# Check if there are any changes
if [[ -n $(git status --porcelain) ]]; then
    echo "---------------------------"
    git status --porcelain
    echo "---------------------------"
    # There are changes, so commit them
    git add .
    git commit -m "Auto-backup: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "$(date): Vault backed up successfully"
else
    echo "No changes to backup"
fi
```

… og LaunchAgent i `~/Library/LaunchAgents/no.prikkprikkprikk.obsidian.backup.plist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>no.prikkprikkprikk.obsidian.backup</string>
    <key>ProgramArguments</key>
    <array>
      <string>/bin/sh</string>
      <string>-c</string>
      <string>/usr/bin/shortcuts run "Obsidian Git Backup"</string>
    </array>
    <key>StartInterval</key>
    <integer>3600</integer>
    <key>RunAtLoad</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/Users/prikkprikkprikk/Library/Logs/obsidian-backup.log</string>
    <key>StandardErrorPath</key>
    <string>/Users/prikkprikkprikk/Library/Logs/obsidian-backup-error.log</string>
</dict>
</plist>
```


