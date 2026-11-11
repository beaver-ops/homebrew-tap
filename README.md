# Beaver Ops Homebrew tap

```
brew install beaver-ops/tap/beaver
```

Formulae for [Beaver Ops](https://app.beaverops.ai) tools. `beaver` is the Beaver Ops CLI
([beaver-ops/beaver-cli](https://github.com/beaver-ops/beaver-cli)).

## How the formula is updated

`.github/workflows/update.yml` runs every 30 minutes (and from the Actions tab): it reads the latest release
of `beaver-ops/beaver-cli` through the public GitHub API and, when it is newer than `Formula/beaver.rb`,
regenerates the formula with `scripts/formula.sh` (URLs of the `v<version>` archives, sha256 from the
release's `checksums.txt`) and commits it with this repository's `GITHUB_TOKEN`. Don't edit the formula by
hand; change `scripts/formula.sh` instead.

Until the first release the formula is a placeholder (v0.0.0, zero checksums) and installing fails.
