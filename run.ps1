param(
    [ValidateSet('setup', 'desktop', 'cli', 'tui', 'dashboard', 'build', 'pack')]
    [string]$Command = 'desktop',
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$AgentArgs
)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
& git submodule update --init --recursive
if ($LASTEXITCODE -ne 0) { throw 'Could not initialize the pinned Hermes source.' }
if (-not $env:HERMES_HOME) { $env:HERMES_HOME = Join-Path $HOME 'raw-agent-data' }
if (-not $env:HERMES_RUNTIME_DIR) { $env:HERMES_RUNTIME_DIR = Join-Path $env:HERMES_HOME 'tools' }
Set-Location (Join-Path $PSScriptRoot 'hermes')
. .\activate.ps1
switch ($Command) {
    'setup' {
        hermes setup
        if ($LASTEXITCODE -ne 0) { throw 'Provider setup failed.' }
        & npm.cmd ci
    }
    'cli' { hermes @AgentArgs }
    'tui' { hermes --tui @AgentArgs }
    'dashboard' { hermes dashboard @AgentArgs }
    default {
        if (-not (Test-Path 'node_modules')) { throw 'Run .\run.ps1 setup from the Raw repository first.' }
        $ScriptName = switch ($Command) { 'desktop' { 'dev' }; 'build' { 'build' }; 'pack' { 'pack' } }
        & npm.cmd run $ScriptName --workspace apps/desktop -- @AgentArgs
    }
}
if ($LASTEXITCODE -ne 0) { throw "Raw command failed with exit code $LASTEXITCODE." }
