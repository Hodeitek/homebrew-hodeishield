# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.7.0/hodeishield-0.7.0-universal-apple-darwin.tar.gz"
      sha256 "d75b9c4afc93457b7927beb455fa56d83dcb68a84ed1a5d953998506927af1f1"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.7.0/hodeishield-0.7.0-universal-apple-darwin.tar.gz"
      sha256 "d75b9c4afc93457b7927beb455fa56d83dcb68a84ed1a5d953998506927af1f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.7.0/hodeishield-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c23b17f235aec8c7dcd87625c5d76565b0a9146d59228026056a6837ee14b837"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.7.0/hodeishield-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "def1f05b47dcf8dbca29808b914c17db5f40155d58066c84965380ea4743b8e3"
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
