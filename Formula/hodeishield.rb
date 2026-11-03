# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.7.1/hodeishield-0.7.1-universal-apple-darwin.tar.gz"
      sha256 "aa1062c45294f0f1bcdb71d15e50633f24a55a0c422c69a83d4efdadd435b628"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.7.1/hodeishield-0.7.1-universal-apple-darwin.tar.gz"
      sha256 "aa1062c45294f0f1bcdb71d15e50633f24a55a0c422c69a83d4efdadd435b628"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.7.1/hodeishield-0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6c2fdbe1a79892659d0b64a15dddcf3e15f1f3bf52e3c66f1c5f1bd8bfe4c3ba"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.7.1/hodeishield-0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fbcc0483b6c311d22d836ae44d2679056b5211fd39670715f3c67ed5b961e4fc"
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
