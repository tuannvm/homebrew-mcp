class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.2/clotch-agent-v0.2.2-darwin-arm64.tar.gz"
      sha256 "ad834686d175477cbe8bc184043e34214fba7258364efbf336d2af6a81560cbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.2/clotch-agent-v0.2.2-linux-arm64.tar.gz"
      sha256 "736f318dc75d91fe6dea3462576d87499e8a9711ce46c802cd53019cf2bdbb18"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.2/clotch-agent-v0.2.2-linux-amd64.tar.gz"
      sha256 "2ff681686ff49a1fc41584d5d153325f0c2d7932df3690b532f80b80ce195c03"
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
