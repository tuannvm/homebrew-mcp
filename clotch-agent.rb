class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.4/clotch-agent-v0.0.4-darwin-arm64.tar.gz"
      sha256 "1693ff8af41bb8ae3006a979d3ad08d98ba21c4b36482be6e6d2a71ffe32d4c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.4/clotch-agent-v0.0.4-linux-arm64.tar.gz"
      sha256 "347f26abcf1c998ccfb26badc09230b1bfe1d04d800fc1e2d39f68eb0d62111a"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.4/clotch-agent-v0.0.4-linux-amd64.tar.gz"
      sha256 "4ff9d2ace9953006c42c37b0f657c3655616d44eaf64232335eb36fb1060a081"
    end
  end

  def install
    bin.install Dir["clotch-agent*"].first => "clotch-agent"
  end

  service do
    run [opt_bin/"clotch-agent", "-interval", "10s"]
    keep_alive true
    log_path var/"log/clotch-agent.log"
    error_log_path var/"log/clotch-agent.log"
  end

  test do
    assert_match "clotch-agent", shell_output("#{bin}/clotch-agent -h 2>&1")
  end
end
