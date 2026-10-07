# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.3.0/hodeishield-0.3.0-universal-apple-darwin.tar.gz"
      sha256 "b19f2fb770963bdd62c6b9dfb370e1f8940ca2c424d725ee4a0dc2f5cb99d605"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.3.0/hodeishield-0.3.0-universal-apple-darwin.tar.gz"
      sha256 "b19f2fb770963bdd62c6b9dfb370e1f8940ca2c424d725ee4a0dc2f5cb99d605"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.3.0/hodeishield-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4b15ec84d051dddb3e9c28dae7f3a845b31a191543028ebe9abe97d596e46bbd"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.3.0/hodeishield-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2d5912e746e7bb4722403a8518db0dbef3187d53bec74c6c9626147136edecba"
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
