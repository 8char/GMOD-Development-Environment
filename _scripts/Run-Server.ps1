# Garrys Mod Configuration
# Server Map
$GMOD_MAP="gm_construct"
# Server Game Mode
$GMOD_GAMEMODE="darkrp"
# Workshop collection ID
#$GMOD_WSCOLLECTION=
# Server Port
$GMOD_PORT=27015
# Max Players
$GMOD_MAXPLAYERS=32

#==================
# No need to touch
#   Below here
#==================

$SvrArgs = "-ip 0.0.0.0 -norestart -game garrysmod -console -port $GMOD_PORT +map $GMOD_MAP +gamemode $GMOD_GAMEMODE +maxplayers $GMOD_MAXPLAYERS -disableluarefresh $args -p2p"
if (-not ([string]::IsNullOrEmpty($GMOD_WSCOLLECTION)))
{
    $SvrArgs += " +host_workshop_collection $GMOD_WSCOLLECTION"
}

"Running a local server with these arguments:"
write-host $SvrArgs

Start-Process -WindowStyle Minimized -FilePath "_server/gmod/srcds.exe" -ArgumentList "$SvrArgs" -Wait