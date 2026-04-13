class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.6/clotch-agent-v0.0.6-darwin-arm64.tar.gz"
      sha256 "18ea4e186fd481bf1a2cc4c461885e1791b980eb2a17ed9b9f2d1f2b9279e130"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.6/clotch-agent-v0.0.6-linux-arm64.tar.gz"
      sha256 "91b9ac8946b4f944b1a1ddfd348908fe562ef05a9a2d0f4d18e9f575c4923bde"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.6/clotch-agent-v0.0.6-linux-amd64.tar.gz"
      sha256 "6839ea4c93c144a761b619b55c6a5552c72be0f14d01a73751c316573aa921a2"
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
