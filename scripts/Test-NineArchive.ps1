$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new()

$requiredRootFiles = @(
    'AGENTS.md',
    'README.md',
    'research/INDEX.md',
    'research/profile.md',
    'skills/nine-research-loop/SKILL.md'
)

foreach ($relativePath in $requiredRootFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $relativePath) -PathType Leaf)) {
        $errors.Add("Missing required file: $relativePath")
    }
}

$validStates = @(
    'drafting_charter', 'exploring', 'awaiting_lemma_approval',
    'rethlas_approved', 'rethlas_running', 'integrating_result',
    'candidate_complete', 'complete', 'suspended'
)

$problemRoot = Join-Path $root 'research/problems'
foreach ($problem in Get-ChildItem -LiteralPath $problemRoot -Directory) {
    foreach ($file in @('charter.md', 'state.md', 'ledger.md', 'dependencies.md')) {
        if (-not (Test-Path -LiteralPath (Join-Path $problem.FullName $file) -PathType Leaf)) {
            $errors.Add("$($problem.Name): missing $file")
        }
    }
    foreach ($directory in @('lemmas', 'rethlas-runs', 'sources', 'outbox')) {
        if (-not (Test-Path -LiteralPath (Join-Path $problem.FullName $directory) -PathType Container)) {
            $errors.Add("$($problem.Name): missing $directory/")
        }
    }

    $statePath = Join-Path $problem.FullName 'state.md'
    if (Test-Path -LiteralPath $statePath -PathType Leaf) {
        $stateText = Get-Content -LiteralPath $statePath -Raw
        $stateMatch = [regex]::Match($stateText, 'Current state:\s*`([^`]+)`')
        if (-not $stateMatch.Success -or $stateMatch.Groups[1].Value -notin $validStates) {
            $errors.Add("$($problem.Name): invalid or missing current state")
        }
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output 'Nine archive structure is valid.'
