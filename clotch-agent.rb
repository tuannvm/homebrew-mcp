class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.8/clotch-agent-v0.2.8-darwin-arm64.tar.gz"
      sha256 "a4e651f87d7d6aa78e99f8d8c4f85d5f56d7ede4168825b7072bf96db3c5eeff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.8/clotch-agent-v0.2.8-linux-arm64.tar.gz"
      sha256 "3e4ac9b47f53e4fb18a4b6979696edfcc4db0e724eada18165a759715a0cd1a6"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.8/clotch-agent-v0.2.8-linux-amd64.tar.gz"
      sha256 "d43b5fa504e78c574cff8df1f18d49f575bfa1b81c8c5a89cfc2d6e6a715104a"
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
