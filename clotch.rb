class Clotch < Formula
  desc "Dynamic Island monitor for Claude Code sessions"
  homepage "https://github.com/tuannvm/clotch"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.2/clotch-island-v0.0.2-darwin-arm64.tar.gz"
      sha256 "8efaa6232d9770c322a2c3ab78b70314c397912c58a1e614dd06a6ea876db736"

      resource "clotch-agent" do
        url "https://github.com/tuannvm/clotch/releases/download/v0.0.2/clotch-agent-v0.0.2-darwin-arm64.tar.gz"
        sha256 "42a0b3319e7d4a6e93ccecc837d2883e82b11bedb7ee9d868f347586438af41e"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.2/clotch-agent-v0.0.2-linux-arm64.tar.gz"
      sha256 "0a310a9111f13ec848d165f4bd63173018115ee06dd46575d137a6e2d31e60b2"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.2/clotch-agent-v0.0.2-linux-amd64.tar.gz"
      sha256 "97e30080d80ece50c77e69baaeca8a226f724a69ddb979a0dffbc1274b896cfb"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "clotch-island"
      resource("clotch-agent").stage do
        bin.install "clotch-agent-darwin-arm64" => "clotch-agent"
      end
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "clotch-agent-linux-arm64" => "clotch-agent"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "clotch-agent-linux-amd64" => "clotch-agent"
    end
  end

  service do
    run [opt_bin/"clotch-agent", "-interval", "10s"]
    keep_alive true
    log_path var/"log/clotch-agent.log"
    error_log_path var/"log/clotch-agent.log"
  end

  def caveats
    <<~EOS
      To start the session scanner agent:
        brew services start clotch

      To launch the Dynamic Island UI (macOS only):
        clotch-island
    EOS
  end

  test do
    assert_match "clotch-agent", shell_output("#{bin}/clotch-agent -h 2>&1")
  end
end
