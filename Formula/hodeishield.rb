# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.2.0/hodeishield-0.2.0-universal-apple-darwin.tar.gz"
      sha256 "ea242f998c49999d9b9a0b5ef6275fd902719c5fb02ee5aceed0a2366a708291"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.2.0/hodeishield-0.2.0-universal-apple-darwin.tar.gz"
      sha256 "ea242f998c49999d9b9a0b5ef6275fd902719c5fb02ee5aceed0a2366a708291"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.2.0/hodeishield-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b017d5990d868b7ffa4b4aecfa9ed9e71c58839321905ab140b0ed9a1cc0ad97"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.2.0/hodeishield-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "27edc7b8fe9f96e4dbbe60c29a8cde520c28c080b28f1bd47f8dfcbe403d6a01"
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
