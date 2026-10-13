# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.3/hodeishield-0.4.3-universal-apple-darwin.tar.gz"
      sha256 "a9a81feec25cd91380a38a72780a8abbaad296246f4677dcb8d4e3b042a70cb5"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.3/hodeishield-0.4.3-universal-apple-darwin.tar.gz"
      sha256 "a9a81feec25cd91380a38a72780a8abbaad296246f4677dcb8d4e3b042a70cb5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.3/hodeishield-0.4.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8e9dd0711fcc55c013e009b3e5bfa25da7dba05116aa8fb0cb44e49feec06be6"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.3/hodeishield-0.4.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "543103cb5a0daf02c79797958e770cc850604c679166ca55e07be8961c650c6c"
    end
  end

  def install
    bin.install "hodeishield"
    man1.install Dir["man/*.1"]
    doc.install "USER-INFORMATION.md"
    generate_completions_from_executable(bin/"hodeishield", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hodeishield --version")
  end
end
