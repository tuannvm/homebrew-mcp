class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.7/clotch-agent-v0.2.7-darwin-arm64.tar.gz"
      sha256 "001fbd7336d687574c25dcd784ef5a2b17ca56899aaaa0f6764d20d66020bee7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.7/clotch-agent-v0.2.7-linux-arm64.tar.gz"
      sha256 "f989e96c931ad2200b334368eeeef77af823d2eac2239a2ca1fe9760686d8c88"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.7/clotch-agent-v0.2.7-linux-amd64.tar.gz"
      sha256 "4ac9c9e20633152e4b2e147fa168c41f7acdec134f4fbe33b02ac77f917ddbd9"
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
