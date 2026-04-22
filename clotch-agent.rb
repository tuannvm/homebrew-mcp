class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.16/clotch-agent-v0.2.16-darwin-arm64.tar.gz"
      sha256 "bb816c0a2223b37b9b60d2445b47732a0dffa24b19403092aeed2f72afebc023"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.16/clotch-agent-v0.2.16-linux-arm64.tar.gz"
      sha256 "e483e12bea78d4e34fe913f2ca1653a0793b778d49088147496943876d22e895"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.16/clotch-agent-v0.2.16-linux-amd64.tar.gz"
      sha256 "19d8ea079ae03cfb935ff3724964f5295a563bc177a99c0f18ba02a6a9f1e5fc"
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
