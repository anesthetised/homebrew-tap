# Homebrew tap

Homebrew formulae for command-line tools.

## Install

```sh
brew install anesthetised/tap/acplause
```

[acplause](https://github.com/anesthetised/acplause) is an experimental ACP v2
agent for OpenAI-compatible APIs. The formula builds tagged source locally,
with Go as a build dependency. On macOS, this avoids requiring a paid Apple
Developer ID signature or a quarantine-removal hook for downloaded binaries.
Local compilation takes longer than installing a prebuilt archive.

## Upgrade

```sh
brew update
brew upgrade acplause
```

The acplause release workflow updates the formula and source checksum after
publishing each GitHub Release.
