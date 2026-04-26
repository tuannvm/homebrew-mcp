class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.22/clotch-agent-v0.2.22-darwin-arm64.tar.gz"
      sha256 "7afe6f11ca88e862e0448812527a8ad13b369d00c88c8b50bb3e0dac01224d5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.22/clotch-agent-v0.2.22-linux-arm64.tar.gz"
      sha256 "f6657791a6de555ecdbab9e6d1af0cb335f8019e0c528128d61ca0324e2a2cf9"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.22/clotch-agent-v0.2.22-linux-amd64.tar.gz"
      sha256 "ce43b4298ab5d25bba66ffd12fd59e5658174732e0e74993d4aa3fbadb989189"
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
