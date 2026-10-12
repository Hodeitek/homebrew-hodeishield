# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.0/hodeishield-0.4.0-universal-apple-darwin.tar.gz"
      sha256 "24ae3ddfca21a934c28972b676e4a5d460b451d00b5ea1dabb3faad19558396f"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.0/hodeishield-0.4.0-universal-apple-darwin.tar.gz"
      sha256 "24ae3ddfca21a934c28972b676e4a5d460b451d00b5ea1dabb3faad19558396f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.0/hodeishield-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3a525f608248eb12d276d3f6f3ff8c63a6d04ad8838386f18daad395f713bc60"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.0/hodeishield-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9a0360aa44a552c53db9aaf444e1ac8cc9682856e6e47d02a5c8e1a873e8d9e5"
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
