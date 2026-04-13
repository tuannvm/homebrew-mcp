class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.5/clotch-agent-v0.0.5-darwin-arm64.tar.gz"
      sha256 "94b042000a7776cb4ee8eb69b46c512766d7d7b257c2705a4988747c4e078510"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.5/clotch-agent-v0.0.5-linux-arm64.tar.gz"
      sha256 "882bc4af71f78c9e091d81c279edc55f513313cddd1e146cae8ff66c8e984ecc"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.0.5/clotch-agent-v0.0.5-linux-amd64.tar.gz"
      sha256 "d139559e4f0f235a28b89f4b14e0c1521c423d067983020b02686ad903dc74e7"
    end
  end

  def install
    bin.install Dir["clotch-agent*"].first => "clotch-agent"
  end

  service do
    run [opt_bin/"clotch-agent", "-interval", "10s"]
    keep_alive true
    log_path var/"log/clotch-agent.log"
    error_log_path var/"log/clotch-agent.log"
  end

  test do
    assert_match "clotch-agent", shell_output("#{bin}/clotch-agent -h 2>&1")
  end
end
