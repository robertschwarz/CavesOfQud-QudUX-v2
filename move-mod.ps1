$MOD_NAME = "QudUX_v2"
$ZIP_FILE = "$MOD_NAME.zip"
$MODS_DIR = "$env:USERPROFILE/AppData/LocalLow/Freehold Games/CavesOfQud/Mods"

Write-Host "Zipping source code..."
Get-ChildItem -Exclude '.git', '.gitignore', '*.zip', 'move-mod.ps1', 'Makefile', 'bin', 'obj' |
    Compress-Archive -DestinationPath $ZIP_FILE -Force

Write-Host "Moving to $MODS_DIR..."
Copy-Item $ZIP_FILE "$MODS_DIR/$ZIP_FILE" -Force

Remove-Item $ZIP_FILE -Force

Write-Host "Moved $ZIP_FILE to $MODS_DIR"
