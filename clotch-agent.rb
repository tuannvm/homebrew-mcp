class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.6/clotch-agent-v0.2.6-darwin-arm64.tar.gz"
      sha256 "8e2abe1dde75eacd8a82d8f238dbe99e66bcfd2e3e91e278c3c914233bce544b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.6/clotch-agent-v0.2.6-linux-arm64.tar.gz"
      sha256 "865c879ad026bcb486e1227d9d3d3e0ec21042cdc2aa6c23b7d20efaf3c6fa97"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.6/clotch-agent-v0.2.6-linux-amd64.tar.gz"
      sha256 "1de60863a943c5495bf44128455ea5a7a8beb90a4223ebb8fd9f007880ec1cfc"
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
