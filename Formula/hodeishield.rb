# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.6.0/hodeishield-0.6.0-universal-apple-darwin.tar.gz"
      sha256 "a247310da0979772984733e59bc774d39c6a696e9192e41014921b80b3650c91"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.6.0/hodeishield-0.6.0-universal-apple-darwin.tar.gz"
      sha256 "a247310da0979772984733e59bc774d39c6a696e9192e41014921b80b3650c91"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.6.0/hodeishield-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "61db0548582e1ce5538a00427aa603265c515cd41c53a2f9a9c6b0de03b82b53"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.6.0/hodeishield-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "81c7ed9460377dab7ebfd4256c8d6388fc1320f1bb5c3aac70302ade08eedca1"
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
