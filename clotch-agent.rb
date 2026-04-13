class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.3/clotch-agent-v0.1.3-darwin-arm64.tar.gz"
      sha256 "f3478012ba5f80ab4c9a29786215360e88cda1ce38c8ad70217ec23c084370ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.3/clotch-agent-v0.1.3-linux-arm64.tar.gz"
      sha256 "e0778f39348ca00a56315c50756795768170fb272e00a66b31f551408be221b5"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.3/clotch-agent-v0.1.3-linux-amd64.tar.gz"
      sha256 "0c5b1e59f06a8606a3c0e23420103f056e06fb30455b95cbc96d824e47f67871"
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
