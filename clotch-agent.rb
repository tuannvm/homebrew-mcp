class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.3/clotch-agent-v0.2.3-darwin-arm64.tar.gz"
      sha256 "e24ea5c940aa5a355e79e02060eb11def11b2a93f68be18164c834a7f2e5c3d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.3/clotch-agent-v0.2.3-linux-arm64.tar.gz"
      sha256 "2c0eb16aa4633b0833f35fc2fd874526b6f5bee320c40b3cb67a579664066cbd"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.3/clotch-agent-v0.2.3-linux-amd64.tar.gz"
      sha256 "e1beaefc3eee00a04f2923b4bb8d3068fa321ee53937da3148dba67cb34fa00a"
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
