class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.18/clotch-agent-v0.2.18-darwin-arm64.tar.gz"
      sha256 "be809d7d39e0aa8b1788f059754ef66b9908d8a6f842387ea8d4bc6c8e28c6f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.18/clotch-agent-v0.2.18-linux-arm64.tar.gz"
      sha256 "5e99dfd452e64934799bb52e4a08ece8ad66836e87ef4f47ac3cbb23fad4fa77"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.18/clotch-agent-v0.2.18-linux-amd64.tar.gz"
      sha256 "7a4a591d20573cc7ea0be9296079f3fd1223142d68321c85f1cbeb5380340cc5"
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
