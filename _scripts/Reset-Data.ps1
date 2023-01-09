"=== Reset Data ==="
# we do "| Out-Null" so it happens silently
Remove-Item "_server/gmod/garrysmod/data/*" -Recurse -Force | Out-Null
New-Item -ItemType Directory -Force -Path "_server/gmod/garrysmod/data"