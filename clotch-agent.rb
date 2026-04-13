class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.2/clotch-agent-v0.1.2-darwin-arm64.tar.gz"
      sha256 "19309585e308689097d2dd30f25cd88e7dd73a2206b5f183c9db3dcebb4c1e2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.2/clotch-agent-v0.1.2-linux-arm64.tar.gz"
      sha256 "f3c43335f4cabaa55465258bb957b44d3f42bf892e7b3feb54aaf7074ba64353"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.2/clotch-agent-v0.1.2-linux-amd64.tar.gz"
      sha256 "0152338ecf7ae7d067369bd68177c9643494d86ee6c49bb51653e0906657bed0"
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
