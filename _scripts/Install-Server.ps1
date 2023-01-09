# Create the addons directory
New-Item -ItemType Directory -Path "addons" -ErrorAction SilentlyContinue

# Create the cfg directory
New-Item -ItemType Directory -Path "cfg" -ErrorAction SilentlyContinue

# Create the gamemodes directory
New-Item -ItemType Directory -Path "gamemodes" -ErrorAction SilentlyContinue

# Create the lua directory
New-Item -ItemType Directory -Path "lua" -ErrorAction SilentlyContinue

# Create the maps directory
New-Item -ItemType Directory -Path "maps" -ErrorAction SilentlyContinue

New-Item -ItemType Directory -Force -Path "_server/gmod/garrysmod" | Out-Null

"=== Mounting Folders ==="
# Call our batch file since powershell requires us as admin to create a symlink
_scripts/create_links.bat

"=== Downloading SteamCMD ==="
$zipUrl = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
$zipFile = "steamcmd.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile

# Extract the zip file to the desired directory
Expand-Archive -Path $zipFile -Destination _server/steamcmd -force

# Delete the zip file
Remove-Item $zipFile

"=== Downloading Server ==="
_server/steamcmd/steamcmd.exe +force_install_dir ../gmod +login anonymous +app_update 4020 +quit

_scripts/Atlas-Framework.ps1

"=== Finished Download ==="
"Run ./_scripts/run_server.ps1 to run the server"
