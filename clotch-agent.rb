class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.15/clotch-agent-v0.2.15-darwin-arm64.tar.gz"
      sha256 "4556fd9e6839855848f1b04282c331c7019d5b925428e606a9eb0b7ee22d7ecc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.15/clotch-agent-v0.2.15-linux-arm64.tar.gz"
      sha256 "c38ea046ced5464058b000e952689c6c94534044f553b63622464bef059266bf"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.15/clotch-agent-v0.2.15-linux-amd64.tar.gz"
      sha256 "2598400c97a77aefd46d314972784676e11f8bb84d1b75a18d5b4acd4762b40d"
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
