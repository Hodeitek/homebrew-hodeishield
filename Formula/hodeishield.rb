# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.4/hodeishield-0.4.4-universal-apple-darwin.tar.gz"
      sha256 "b77a5ca8ee99bb0591d8504e62f09af402395d8e56a54f915727303008859a96"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.4/hodeishield-0.4.4-universal-apple-darwin.tar.gz"
      sha256 "b77a5ca8ee99bb0591d8504e62f09af402395d8e56a54f915727303008859a96"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.4/hodeishield-0.4.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "86a890ac57952c061f19e87770f4334e7c8d591374015f96576ad874251193b3"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.4/hodeishield-0.4.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "04b6740d5fa78f241d3048d47191f8c4f4f50f5a71603a8b3bc2d345f24de839"
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
