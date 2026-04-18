class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.10/clotch-agent-v0.2.10-darwin-arm64.tar.gz"
      sha256 "6a7874e92a3a08696a61fb6d124d3f2adc45cddd3c1d1439cdaffc12eabfcf17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.10/clotch-agent-v0.2.10-linux-arm64.tar.gz"
      sha256 "5b9c7b6748866f98fc9a45321d8704aceaf32f95f1706749c34ba2eb8d272177"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.10/clotch-agent-v0.2.10-linux-amd64.tar.gz"
      sha256 "3041eec84c9533cbe66f93dee023702c67728869d943f93f2b0f53ae178747f4"
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
