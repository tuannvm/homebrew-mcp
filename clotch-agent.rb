class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.12/clotch-agent-v0.2.12-darwin-arm64.tar.gz"
      sha256 "deb94ef993bee4ea329d06f87f71917dde7dadfb55df8fd64daa9e84d7e614e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.12/clotch-agent-v0.2.12-linux-arm64.tar.gz"
      sha256 "53634f158fb96949c907e2d97f0c50cfca5c5a602d130d7126ab8ca0a81c3fe2"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.12/clotch-agent-v0.2.12-linux-amd64.tar.gz"
      sha256 "3f2dcc9f909646a1e1778f5ea7314eaca1665eac01357fe18e23dbb599a90b83"
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
