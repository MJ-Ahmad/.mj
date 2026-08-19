# Root folder
$root = "C:\Users\quran\Desktop\.mj"

# Ensure root exists
if (-not (Test-Path $root)) {
    New-Item -ItemType Directory -Path $root | Out-Null
}

# Path to your exported bookmarks file
$bookmarkFile = "C:\Users\quran\Desktop\.mj\favorites.html"
$html = Get-Content $bookmarkFile -Raw

# Function to sanitize names for Windows filesystem
function ConvertTo-SanitizedName {
    param([string]$name)
    $invalid = [System.IO.Path]::GetInvalidFileNameChars()
    foreach ($c in $invalid) { $name = $name.Replace($c,'_') }
    return $name.Trim()
}

# Regex to capture folders (<H3>) and links (<A>)
$folderStack = @($root)
$lines = $html -split "`n"

foreach ($line in $lines) {
    if ($line -match '<H3.*?>(.+?)</H3>') {
        $folderName = ConvertTo-SanitizedName($matches[1])
        $currentPath = Join-Path ($folderStack[-1]) $folderName
        if (-not (Test-Path $currentPath)) {
            New-Item -ItemType Directory -Path $currentPath | Out-Null
            Write-Host "Created folder: $currentPath"
        }
        $folderStack += $currentPath
    }
    elseif ($line -match '</DL>') {
        # Closing a folder level
        if ($folderStack.Count -gt 1) {
            $folderStack = $folderStack[0..($folderStack.Count-2)]
        }
    }
    elseif ($line -match '<A .*?HREF="([^"]+)"[^>]*>(.+?)</A>') {
        $url = $matches[1]
        $siteName = ConvertTo-SanitizedName($matches[2])
        $urlFile = Join-Path ($folderStack[-1]) ($siteName + ".url")
        $content = "[InternetShortcut]`r`nURL=" + $url
        Set-Content -Path $urlFile -Value $content -Encoding ASCII
        Write-Host "Added link: $urlFile"
    }
}