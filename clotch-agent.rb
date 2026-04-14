class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.1/clotch-agent-v0.2.1-darwin-arm64.tar.gz"
      sha256 "1fbe483c5c360928dbb1c253ee504b7dae6749245bddc8c62af027c58058aa2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.1/clotch-agent-v0.2.1-linux-arm64.tar.gz"
      sha256 "151f6d7d69a0271d364516c046ab075a1efc008c5c8a0178e833cedd7eaeff0d"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.1/clotch-agent-v0.2.1-linux-amd64.tar.gz"
      sha256 "f202557db746e25035c1bff333931dd7eaf7d15c79310991688e8cbfa73ad939"
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
