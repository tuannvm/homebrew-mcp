class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.0/clotch-agent-v0.1.0-darwin-arm64.tar.gz"
      sha256 "9f1a65eee6027ba5a84dfa29e68a71a6c7bfa003b2c2a3a77cfddfadba7a8c37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.0/clotch-agent-v0.1.0-linux-arm64.tar.gz"
      sha256 "93132c7f987420431fbaf1521dbe837331967dc1176f76e6bedcc0d1bcbe5861"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.0/clotch-agent-v0.1.0-linux-amd64.tar.gz"
      sha256 "881dd39edcf917b4be4fcdd0c852e4a215ec6f6883ca88457ebda13089a9b0fa"
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
