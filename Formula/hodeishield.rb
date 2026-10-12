# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.1/hodeishield-0.4.1-universal-apple-darwin.tar.gz"
      sha256 "0abb420bbaa30a4a01df7fb7fa66499b2a8f514f332684284ce9c1be09b86051"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.1/hodeishield-0.4.1-universal-apple-darwin.tar.gz"
      sha256 "0abb420bbaa30a4a01df7fb7fa66499b2a8f514f332684284ce9c1be09b86051"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.1/hodeishield-0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1b90a5a9f3a87c5ba2a12f3ebf35494e4f5b210e6176fc825bb54b04b2269c04"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.1/hodeishield-0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "57f553acfa9e3e7e7ccf5664f30a3295ce92ed14a392b294fe999ebff8d0f040"
    end
  end

  def install
    bin.install "hodeishield"
    man1.install Dir["man/*.1"]
    generate_completions_from_executable(bin/"hodeishield", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hodeishield --version")
  end
end
