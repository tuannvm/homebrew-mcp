class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.5/clotch-agent-v0.2.5-darwin-arm64.tar.gz"
      sha256 "b1b2d941d2dbf952e8e26083f075ed56d8d01154eb44aa15b15109c2c30134c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.5/clotch-agent-v0.2.5-linux-arm64.tar.gz"
      sha256 "45ddb97f7cbf9af5ec5d138ae4c570df003b5a44d4af4c82a548e7b25e0cc62c"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.5/clotch-agent-v0.2.5-linux-amd64.tar.gz"
      sha256 "2d0c60017fc6ce63018b1236203ad1a034d5ebc18835d65ab4939f57ad198b01"
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
