# Raw Agent

A repository that clones the **actual Hermes Agent core and Electron desktop app** at a fixed, tested revision. It retains the original CLI/TUI, memory, skills, MCP/plugins, messaging gateway, scheduler, providers and execution backends. Copyright Nous Research; MIT license preserved.

**Source arrangement:** the `hermes/` directory is a Git submodule pinned to `dde8800ed91c6e128064a17d5db914d74622594b`. Clone recursively to obtain all 17,902 original source files. GitHub's ZIP download does not include submodule contents. This is an independent launch repository with the original Hermes product identity, not a separately branded distribution.

## macOS / Linux

Install Git and your OS's native compiler tools. On macOS, install the Xcode Command Line Tools. Then:

```bash
git clone --recurse-submodules https://github.com/seven0070/raw.git
cd raw
bash run.sh setup
bash run.sh desktop
```

Setup provisions the original managed Python runtime, runs provider setup, and installs the pinned Node dependencies. Choose your own provider/API key or local model service. Voice, messaging, browsing and remote execution require the corresponding services and credentials.

On macOS you can also open `Open-Raw.command` after setup.

## Windows

Install Git and the native compiler/SDK required by the upstream platform guide, then use PowerShell:

```powershell
git clone --recurse-submodules https://github.com/seven0070/raw.git
cd raw
.\run.ps1 setup
.\run.ps1 desktop
```

The original [platform support guide](https://github.com/NousResearch/hermes-agent/blob/dde8800ed91c6e128064a17d5db914d74622594b/website/docs/getting-started/platform-support.md) is authoritative for host requirements.

## Commands

| Command | What it runs |
| --- | --- |
| `desktop` | Original Electron desktop development app with the real backend |
| `cli` | Original agent CLI |
| `tui` | Original terminal UI |
| `dashboard` | Original web dashboard |
| `build` | Desktop production compilation |
| `pack` | Native unpacked desktop packaging for the current OS |

Example: `bash run.sh cli`, or `.\run.ps1 cli`. Desktop and CLI share the dedicated Raw data home, which defaults to `$HOME/raw-agent-data`. Existing `HERMES_HOME` and `HERMES_RUNTIME_DIR` overrides are respected. User data and secrets stay outside the source tree.

## Native installers

The full standalone Python-runtime bundle has additional requirements. Follow `hermes/apps/desktop/BUILDING.md` for the complete bundle builder. Build macOS on macOS and Windows on Windows. Signing, notarization and release/update feeds require your own release configuration and credentials. The development `pack` command does not make a complete standalone Python-runtime bundle.

## Verification and limits

At the pinned revision, desktop production compilation, desktop type checking, Linux x64 unpacked packaging and ten focused packaging/launch contract tests passed. The complete copied source was compared against all 17,902 upstream tracked paths with zero byte differences. See [VERIFICATION.md](VERIFICATION.md).

The launch scripts have syntax and dispatch checks; end-to-end execution of their interactive setup is not verified here. No claim is made of live provider, voice or messaging verification, exhaustive security auditing, signed installers, macOS/Windows startup, or automatic update delivery. This preserves Hermes's implementation; it does not supply provider accounts.

## Updates and attribution

Review upstream changes before advancing the submodule pin. Avoid `git submodule update --remote` unless you intend an upgrade. Do not use upstream `hermes update` to maintain this wrapper's pinned checkout. Original logos, command names and upstream installer identities remain; configure independent identities and update feeds before distributing a branded release.

Upstream: https://github.com/NousResearch/hermes-agent. Original MIT notice: [LICENSE](LICENSE); the complete original source contains its other notices as well.
