# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.3.1/hodeishield-0.3.1-universal-apple-darwin.tar.gz"
      sha256 "138a7db90072e462b1c3cd1179fc4c0d790f0c578316fa50e7d7d0f4c0b62fa8"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.3.1/hodeishield-0.3.1-universal-apple-darwin.tar.gz"
      sha256 "138a7db90072e462b1c3cd1179fc4c0d790f0c578316fa50e7d7d0f4c0b62fa8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.3.1/hodeishield-0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "44621d036cd5e1a62f1ac09f6aa3dda03d0a4861707ff8b9924274b3e2d9b2cc"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.3.1/hodeishield-0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1b4237b79e0f080a27d4eb4ec825d86b736b833e6a9ca974793d29fa229773db"
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
