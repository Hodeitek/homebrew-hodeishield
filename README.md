# Homebrew tap for the HodeiShield CLI

Formulae for [`hodeishield`](https://github.com/Hodeitek/hodeishield-cli), the read-only
command-line client for [HodeiShield](https://hodeishield.com), on macOS (Apple silicon and Intel)
and Linux (x86_64 and arm64).

## Install

```sh
brew tap hodeitek/tap
brew install hodeishield
```

The formula is published from the first CLI release that includes it; until then, use the archives
on the [releases page](https://github.com/Hodeitek/hodeishield-cli/releases).

## How it is maintained

The formula is written by the CLI's release workflow from the release's own archives and
`SHA256SUMS`, so it always points at the files that release published and signed. To check those
files independently, see
[Verifying releases](https://github.com/Hodeitek/hodeishield-cli/blob/main/docs/verifying-releases.md).

Report problems in the [CLI repository](https://github.com/Hodeitek/hodeishield-cli/issues).

## License

[Apache License 2.0](LICENSE).
