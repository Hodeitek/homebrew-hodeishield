# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.5.1/hodeishield-0.5.1-universal-apple-darwin.tar.gz"
      sha256 "666a58f13b91ff7203c5794e6da6e1afdfefef9e35b12c6f0bb9a7782425ec93"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.5.1/hodeishield-0.5.1-universal-apple-darwin.tar.gz"
      sha256 "666a58f13b91ff7203c5794e6da6e1afdfefef9e35b12c6f0bb9a7782425ec93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.5.1/hodeishield-0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6fd5d42f4f7cc00f7f1ca6741888452344da1b122b80e91e516a3f1b95b8be64"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.5.1/hodeishield-0.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "de7b1907752e2f3e7061fd0c8c2937e6be702e95fa8ca6be88363a5b6f45ed62"
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
