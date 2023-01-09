# Download the zip file
Invoke-WebRequest -Uri "https://github.com/FPtje/DarkRP/archive/refs/heads/master.zip" -OutFile "darkrp.zip"

# Extract the zip file to the gamemodes/darkrp directory
Expand-Archive -Path "darkrp.zip" -DestinationPath "gamemodes/darkrp"

# Move the contents of gamemodes/darkrp/DarkRP-master to gamemodes/darkrp
Get-ChildItem "gamemodes/darkrp/DarkRP-master" -Recurse | Move-Item -Destination "gamemodes/darkrp"

# Delete the DarkRP-master directory
Remove-Item "gamemodes/darkrp/DarkRP-master" -Recurse -Force

# Delete the zip file
Remove-Item "darkrp.zip"

# Delete the specified files from the gamemodes/darkrp directory
Remove-Item "gamemodes/darkrp/CONTRIBUTING.md"
Remove-Item "gamemodes/darkrp/DON'T TOUCH ANY OF THESE FILES.txt"
Remove-Item "gamemodes/darkrp/glualint.json"
Remove-Item "gamemodes/darkrp/ISSUE_TEMPLATE.md"
Remove-Item "gamemodes/darkrp/LICENSE.txt"
Remove-Item "gamemodes/darkrp/README.md"