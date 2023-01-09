@ECHO OFF

rem powershell requires us to run as admin for their commands, batch does not
mklink /J ".\_server\gmod\garrysmod\addons" ".\addons"
mklink /J ".\_server\gmod\garrysmod\cfg" ".\cfg"
mklink /J ".\_server\gmod\garrysmod\gamemodes" ".\gamemodes"
mklink /J ".\_server\gmod\garrysmod\lua" ".\lua"
mklink /J ".\_server\gmod\garrysmod\maps" ".\maps"