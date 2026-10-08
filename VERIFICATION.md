# Verification

Pinned source: `dde8800ed91c6e128064a17d5db914d74622594b`.

| Check | Result |
| --- | --- |
| Complete local source copy | 17,902 original tracked paths compared; zero byte/symlink differences |
| Desktop production build | Passed on Linux x64 / Node 24 |
| Desktop renderer, Electron, E2E-helper and builder-config type checks | Passed |
| Native terminal dependency preparation | Passed for Linux x64 |
| Linux unpacked Electron packaging | Passed; Electron 40.10.2 |
| Focused packaging and launch contract tests | 10 passed locally and 10 passed in independent sandbox |
| Original legal notice preservation | Passed |
| Linux optional HUD modifier | Unavailable: host lacks X11 development headers; packaging continued |
| Live providers / voice / messaging / remote execution | Not tested |
| Native interactive GUI startup | Not tested |
| macOS / Windows installers and signing | Not built here |
| Full bundled Python runtime | Not built; source setup is required |
| Complete semantic/security audit | Not performed; copy tool scan exceeded 100 MB cap |

This repository uses an exact Git submodule pin because the GitHub copy workflow's 40 MB archive cap prevented publishing the full source archive. A recursive clone fetches the complete original source; GitHub ZIP downloads do not.

The pinned implementation retains upstream product identity and release/update defaults. It is not an independently signed or branded release. Launcher syntax/dispatch checks are separate from the original application checks above.
