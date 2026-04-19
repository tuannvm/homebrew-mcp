class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.13/clotch-agent-v0.2.13-darwin-arm64.tar.gz"
      sha256 "2020e94529eed6e49bc9ed6225c124ae0da8f54007308af37013346d06d492a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.13/clotch-agent-v0.2.13-linux-arm64.tar.gz"
      sha256 "76c9d511636d105bc78a2fbab7f9c2d7ff0913257b5ae84c7594ca9a9cb2d0a1"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.13/clotch-agent-v0.2.13-linux-amd64.tar.gz"
      sha256 "5a1ea6dd968673629f6fc5bdc565037f30502b43b45cd6186daf7208f07227d7"
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
