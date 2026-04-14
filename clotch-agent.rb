class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.4/clotch-agent-v0.1.4-darwin-arm64.tar.gz"
      sha256 "5c7fba1e3dfd34f688c4f4a265fff89c66ea243a14f667b0e62aff5b6c3ba19d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.4/clotch-agent-v0.1.4-linux-arm64.tar.gz"
      sha256 "c074833b6b5fbc97e2e2fe98bb74df66566ef4a7959fbf54f37e6b9d35d33670"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.1.4/clotch-agent-v0.1.4-linux-amd64.tar.gz"
      sha256 "b7a142c6b8f3472050285bd18711374c6634db56e98efdaa6c9029ce1bc31bd5"
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
