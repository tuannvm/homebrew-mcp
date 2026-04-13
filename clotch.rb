class Clotch < Formula
  desc "Dynamic Island monitor for Claude Code sessions"
  homepage "https://github.com/tuannvm/clotch"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.3/clotch-island-v0.0.3-darwin-arm64.tar.gz"
      sha256 "01e4c89d9574464c5931d74e04cd6442a330e9f2dece4e168fdd36a227ebac6b"

      resource "clotch-agent" do
        url "https://github.com/tuannvm/clotch/releases/download/v0.0.3/clotch-agent-v0.0.3-darwin-arm64.tar.gz"
        sha256 "9560bdd4b83a2c34ec2c4269a6b019e5a5652a421f92d9749f04d9c890f40429"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.3/clotch-agent-v0.0.3-linux-arm64.tar.gz"
      sha256 "cc59759923c91508e27ec3479334a019e4dd92786e29179faa6b85090b604766"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.3/clotch-agent-v0.0.3-linux-amd64.tar.gz"
      sha256 "b153142ee64ddfab329b4c21ca07b9ba70a1a6c2e92ada3ed7b8f45008008518"
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
