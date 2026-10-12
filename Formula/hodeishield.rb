# Written by the release workflow of https://github.com/Hodeitek/hodeishield-cli; do not edit by hand.
class Hodeishield < Formula
  desc "Read-only command-line client for HodeiShield"
  homepage "https://hodeishield.com"
  license "Apache-2.0"

  # One universal binary serves both Mac architectures.
  on_macos do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.2/hodeishield-0.4.2-universal-apple-darwin.tar.gz"
      sha256 "fdb5b077d95397bd760c79f6df4200c4098d6622e7e41ebd89fd3ee86ca2e509"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.2/hodeishield-0.4.2-universal-apple-darwin.tar.gz"
      sha256 "fdb5b077d95397bd760c79f6df4200c4098d6622e7e41ebd89fd3ee86ca2e509"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.2/hodeishield-0.4.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7391f58a90c724bb429baec49b57e879593c092d64628849ac30c22999f1858a"
    end
    on_arm do
      url "https://github.com/Hodeitek/hodeishield-cli/releases/download/v0.4.2/hodeishield-0.4.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "90ba46f7109aeb01a95f7f02de36b8dd2adbea3394c81af68ed92a9c82fa1071"
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
