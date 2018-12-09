param(
    #
    [Parameter(Mandatory=$false)]
    [string] $StagingDirectory = ".\release\staging",
    #
    [Parameter(Mandatory=$false)]
    [string] $PackagePath = ".\ManagedApplication.zip"
)

## Convert relative paths to absolute
if (![System.IO.Path]::IsPathRooted($StagingDirectory)) {
    $StagingDirectory = [System.IO.Path]::GetFullPath((Join-Path (Get-Location).ProviderPath $StagingDirectory))
}
if (![System.IO.Path]::IsPathRooted($PackagePath)) {
    $PackagePath = [System.IO.Path]::GetFullPath((Join-Path (Get-Location).ProviderPath $PackagePath))
}

## Source Files
[string[]] $SourceFiles = @(
    "..\src\mainTemplate.json"
    "..\src\createUiDefinition.json"
)

## Copy Files to Staging Directory
[void](New-Item $StagingDirectory -ItemType Directory -ErrorAction SilentlyContinue)
$StagingFiles = Copy-Item $SourceFiles -Destination $StagingDirectory -Force -PassThru -ErrorAction Stop

## Zip Files in Staging Directory
Remove-Item $PackagePath -Force -ErrorAction SilentlyContinue
Add-Type -Assembly "System.IO.Compression.FileSystem"
[System.IO.Compression.ZipFile]::CreateFromDirectory($StagingDirectory, $PackagePath)

## Remove Staging Files
Remove-Item $StagingFiles
