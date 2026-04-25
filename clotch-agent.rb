class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.19/clotch-agent-v0.2.19-darwin-arm64.tar.gz"
      sha256 "7085ea76bec9426afff507a53adf13b2131c949bfd362dc023cbadc78b319caa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.19/clotch-agent-v0.2.19-linux-arm64.tar.gz"
      sha256 "6d82777f9a3f86d9e9841bcf4f082b29d69ff80c392f2dc4badd21d6cf8a3c60"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.19/clotch-agent-v0.2.19-linux-amd64.tar.gz"
      sha256 "f74476bef84d40eb215188f5b4181c5763728d747759d7b84a5ff26f0df0d403"
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
