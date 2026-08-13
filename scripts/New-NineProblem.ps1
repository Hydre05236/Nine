param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[a-z0-9][a-z0-9-]*$')]
    [string]$Id,

    [Parameter(Mandatory = $true)]
    [string]$Title
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$target = Join-Path $root "research/problems/$Id"

if (Test-Path -LiteralPath $target) {
    throw "Problem '$Id' already exists at $target"
}

$date = Get-Date -Format 'yyyy-MM-dd'
$replacements = @{
    '{{PROBLEM_ID}}' = $Id
    '{{TITLE}}' = $Title
    '{{DATE}}' = $date
}

New-Item -ItemType Directory -Path $target | Out-Null
foreach ($directory in @('lemmas', 'rethlas-runs', 'sources', 'outbox')) {
    New-Item -ItemType Directory -Path (Join-Path $target $directory) | Out-Null
    New-Item -ItemType File -Path (Join-Path $target "$directory/.gitkeep") | Out-Null
}

$templates = @{
    'problem-charter.md' = 'charter.md'
    'problem-state.md' = 'state.md'
    'research-ledger.md' = 'ledger.md'
    'dependencies.md' = 'dependencies.md'
}

foreach ($entry in $templates.GetEnumerator()) {
    $content = Get-Content -LiteralPath (Join-Path $root "templates/$($entry.Key)") -Raw
    foreach ($replacement in $replacements.GetEnumerator()) {
        $content = $content.Replace($replacement.Key, $replacement.Value)
    }
    Set-Content -LiteralPath (Join-Path $target $entry.Value) -Value $content -Encoding utf8
}

Write-Output $target
