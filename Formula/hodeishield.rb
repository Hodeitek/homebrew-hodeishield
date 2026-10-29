# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.6.1/hodeishield-0.6.1-universal-apple-darwin.tar.gz"
      sha256 "b23411b99527fafa4631f0a787dccc77d06603b5ff6f06fe811f02fe6b0697b4"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.6.1/hodeishield-0.6.1-universal-apple-darwin.tar.gz"
      sha256 "b23411b99527fafa4631f0a787dccc77d06603b5ff6f06fe811f02fe6b0697b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.6.1/hodeishield-0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2503f4b7ae4921d41207b05876a48c9b6d39c3baad047dfc738f801835cbfde4"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.6.1/hodeishield-0.6.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bd69e74c05a49fb30352a5c54800f96330d189c7fe07ceef70f9fb6ad8d301b7"
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
