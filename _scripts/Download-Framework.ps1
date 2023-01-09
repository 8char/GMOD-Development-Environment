# Delete the directory if it exists
if (Test-Path "addons/atlasframework") {
    "=== Removing Existing AtlasFramework Addon ==="
    Remove-Item -Recurse "addons/atlasframework"
}

$latestRelease = Invoke-WebRequest -Uri "https://api.github.com/repos/8char/AtlasFramework/releases/latest" | ConvertFrom-Json
$assets = $latestRelease.assets | Select-Object -ExpandProperty browser_download_url

"=== Downloading AtlasFramework ==="

foreach ($asset in $assets) {
    $zipFile = Split-Path -Leaf $asset
    Invoke-WebRequest -Uri $asset -OutFile $zipFile

    # Extract the zip file to the desired directory
    Expand-Archive -Path $zipFile -DestinationPath "addons/atlasframework"

    # Delete the zip file
    Remove-Item $zipFile
}

"=== Finished Download ==="