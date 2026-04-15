class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.4/clotch-agent-v0.2.4-darwin-arm64.tar.gz"
      sha256 "411dd16d1e16ae33addd7d1e40495ea7bf54889b1837cd30d825586aa8188283"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.4/clotch-agent-v0.2.4-linux-arm64.tar.gz"
      sha256 "fb1fe55e7f8019e9a5342753d1ed4c8c3acfb6c4de9ee561d03245f79b7ec74a"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.4/clotch-agent-v0.2.4-linux-amd64.tar.gz"
      sha256 "bf0c748c827d416607248efa85218b294b5ac03fe4a2e5e784b944cd32e287ad"
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
