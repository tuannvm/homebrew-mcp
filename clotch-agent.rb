class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.11/clotch-agent-v0.2.11-darwin-arm64.tar.gz"
      sha256 "1f4675b62b87f2911d010feecc051972d03b1c3fc7626adf61fb6de870b1248e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.11/clotch-agent-v0.2.11-linux-arm64.tar.gz"
      sha256 "8a785ed13ed183c191964843b2586a2da232754c509169423624cf50d6833a0b"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.11/clotch-agent-v0.2.11-linux-amd64.tar.gz"
      sha256 "7f2e2d529e20536ba8920f1aa3c126e6771e674408af756099a45ea51cad049e"
    end
  end

  def install
    bin.install Dir["clotch-agent*"].first => "clotch-agent"
  end

  service do
    run [opt_bin/"clotch-agent", "-interval", "1m"]
    keep_alive true
    log_path var/"log/clotch-agent.log"
    error_log_path var/"log/clotch-agent.log"
  end

  test do
    assert_match "clotch-agent", shell_output("#{bin}/clotch-agent -h 2>&1")
  end
end
