class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.9/clotch-agent-v0.2.9-darwin-arm64.tar.gz"
      sha256 "c4bcfa47785b2a3b427a390a0c42e7ff013eb5a9dd5f3026c084828460e4145a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.9/clotch-agent-v0.2.9-linux-arm64.tar.gz"
      sha256 "d75aa9701a9d95ca82725f623b3fb8d88a4192962cf0b92e86afad2832946b53"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.9/clotch-agent-v0.2.9-linux-amd64.tar.gz"
      sha256 "826a736c885dd4bbaefcb52f195f246f4d3b445c741edd45ef3704e30ceb596a"
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
