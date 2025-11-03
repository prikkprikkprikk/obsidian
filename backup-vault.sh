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
