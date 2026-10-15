# Homebrew tap for the HodeiShield CLI

Formulae for [`hodeishield`](https://github.com/Hodeitek/hodeishield-cli), the read-only
command-line client for [HodeiShield](https://hodeishield.com), on macOS (Apple silicon and Intel)
and Linux (x86_64 and arm64).

## Install

```sh
brew install hodeitek/hodeishield/hodeishield
```

Homebrew asks you to trust a formula from a tap other than its own before it loads it
([Tap Trust](https://docs.brew.sh/Tap-Trust)). The full name adds this tap and trusts only this
formula. If you added the tap before and see "Refusing to load formula … from untrusted tap", run
`brew trust --formula hodeitek/hodeishield/hodeishield` once. There is no need to trust the whole
tap or to turn tap trust off.

## How it is maintained

The formula is written by the CLI's release workflow from the release's own archives and
`SHA256SUMS`, so it always points at the files that release published and signed. To check those
files independently, see
[Verifying releases](https://github.com/Hodeitek/hodeishield-cli/blob/main/docs/verifying-releases.md).

Report problems in the [CLI repository](https://github.com/Hodeitek/hodeishield-cli/issues).

## License

[Apache License 2.0](LICENSE).
