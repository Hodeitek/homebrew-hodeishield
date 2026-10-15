# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.5.0/hodeishield-0.5.0-universal-apple-darwin.tar.gz"
      sha256 "3a6dd6e66c975de1e92d1b6fe444512ad41f0046a503733a8eaf15a5f1393c00"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.5.0/hodeishield-0.5.0-universal-apple-darwin.tar.gz"
      sha256 "3a6dd6e66c975de1e92d1b6fe444512ad41f0046a503733a8eaf15a5f1393c00"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.5.0/hodeishield-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1b01a95334ac932f741f6b8d0d0c4da74b8b02e9eadf0031dd93d84954ef7865"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.5.0/hodeishield-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "01ca98a7fea4ebf694aca7f03a882820e184edb86ab7aff942ae5a3e175f5505"
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
