# Define root folder
$root = "C:\Users\quran\Desktop\.mj\Favorite"

# Function to create folders recursively
function New-FolderTree {
    param([string]$base, [string[]]$paths)

    foreach ($path in $paths) {
        $fullPath = Join-Path $base $path
        if (-not (Test-Path $fullPath)) {
            New-Item -ItemType Directory -Path $fullPath | Out-Null
            Write-Host "Created: $fullPath"
        }
    }
}

# Main folder tree (simplified from Note.txt)
$folders = @(
    "ancillary\Agenda",
    "ancillary\Resources\Reliable Resources",
    "ancillary\Resources\Contact",
    "ancillary\Resources\Challenge\QURANER FARIWALA",
    "ancillary\Resources\Challenge\Marketing Platform\Meta\Android",
    "ancillary\Resources\Challenge\Marketing Platform\Meta\Facebook",
    "ancillary\Resources\Challenge\Marketing Platform\Google",
    "ancillary\Resources\Challenge\Marketing Platform\Microsoft",
    "ancillary\Resources\Travel Agency",
    "ancillary\Resources\UVP UNV",
    "ancillary\Resources\UNV ECAMPUS",
    "ancillary\Resources\Social",
    "ancillary\Resources\Development",
    "ancillary\Resources\Articles\Notes",
    "ancillary\Resources\Projects\Ongoing Projects\AdvertisingProject\src",
    "ancillary\Resources\Projects\Ongoing Projects\AdvertisingProject\docs",
    "ancillary\Resources\Projects\Ongoing Projects\AdvertisingProject\tests",
    "ancillary\Resources\Projects\Ongoing Projects\AdvertisingProject\assets",
    "ancillary\Resources\Projects\Travel",
    "ancillary\Resources\Projects\Quraner Fariwala",
    "ancillary\Resources\Storage",
    "ancillary\Resources\mj-ahmad",
    "ancillary\Resources\Others\imp",
    "ancillary\Resources\Others\Docs",
    "ancillary\Resources\Others\mj",
    "ancillary\Resources\Others\Local",
    "ancillary\Resources\Others\BQ",
    "ancillary\Resources\Others\mj.dev",
    "ancillary\Resources\Others\ML.NET",
    "ancillary\Resources\Others\BGS-AI",
    "ancillary\Resources\Others\Timeline",
    "ancillary\Resources\Others\Sources",
    "ancillary\Resources\Others\Projects",
    "ancillary\Resources\Others\Accept",
    "ancillary\Resources\Others\CLI",
    "ancillary\Resources\Others\2025",
    "ancillary\Resources\Others\pack",
    "Last_Effort\Work Assets Links",
    "Last_Effort\Resources",
    "Last_Effort\Development",
    "Last_Effort\Support",
    "Last_Effort\mylife",
    "Last_Effort\Links",
    "Last_Effort\Community",
    "Last_Effort\High",
    "Last_Effort\Associate",
    "Last_Effort\Main Focus"
)

# Create root and folders
if (-not (Test-Path $root)) {
    New-Item -ItemType Directory -Path $root | Out-Null
}
New-FolderTree -base $root -paths $folders
