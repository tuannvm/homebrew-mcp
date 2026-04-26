class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.20/clotch-agent-v0.2.20-darwin-arm64.tar.gz"
      sha256 "9a46149ea58798977a9a5040c50996c08b83fb6a42c29251c0e7ba0028feffa5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.20/clotch-agent-v0.2.20-linux-arm64.tar.gz"
      sha256 "c8150dcdddb575f23074fc0afc38ddc16a0fcc9f04406ee40d47bf3035d6e525"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.20/clotch-agent-v0.2.20-linux-amd64.tar.gz"
      sha256 "fde5fe46150263032fbab8bd21523655f7d70d02a0853c2a71ecfdd119d2404c"
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
