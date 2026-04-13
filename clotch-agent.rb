class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.1/clotch-agent-v0.1.1-darwin-arm64.tar.gz"
      sha256 "d404fc690458d9da763a062a8afea6e4c14aa54eb8c2c15fe7706bd45c4f30e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.1/clotch-agent-v0.1.1-linux-arm64.tar.gz"
      sha256 "a689060fc88ee921147025cc0150c516520e6f9ef0f51cf88762878b88906bbc"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.1/clotch-agent-v0.1.1-linux-amd64.tar.gz"
      sha256 "a8bf4bd9be5bc38f03433c141dd7bc4a5c45073ad51566e6cdf3ab7e3a03b1ce"
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
