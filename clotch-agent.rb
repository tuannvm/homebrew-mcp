class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.14/clotch-agent-v0.2.14-darwin-arm64.tar.gz"
      sha256 "14b5899c48e587567c61153c29831552982c61d47879ba9f6879e6313c20f749"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.14/clotch-agent-v0.2.14-linux-arm64.tar.gz"
      sha256 "fb4fc98f1d7848ffc9078051d0e1dbad701727625ced6354da5f383dbca3a5bd"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.14/clotch-agent-v0.2.14-linux-amd64.tar.gz"
      sha256 "12c9a699af3ccec99dc7df8cb07c87b90902547bd1714a2c618de6f272ce4045"
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
