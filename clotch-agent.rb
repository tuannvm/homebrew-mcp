class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.0/clotch-agent-v0.2.0-darwin-arm64.tar.gz"
      sha256 "9227e93c13cec06e3fee79e15fe322fb82d7954f6d428c2c4343c698d0da0a2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.0/clotch-agent-v0.2.0-linux-arm64.tar.gz"
      sha256 "9ec42649b12adfc09e7b1bb6ebda4175bb4c09d4ba95465e451920ac531e4b4b"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.0/clotch-agent-v0.2.0-linux-amd64.tar.gz"
      sha256 "0fca26a1c423701ea9f18075afbe8add7fcc315a9f012387e28d361030f24a24"
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
