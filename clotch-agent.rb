class ClotchAgent < Formula
  desc "Session scanner agent for Clotch"
  homepage "https://github.com/tuannvm/clotch"
  version "0.2.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.21/clotch-agent-v0.2.21-darwin-arm64.tar.gz"
      sha256 "2f228a9c1cc1a32298a609c0f026866599248f91bda9f871113203efebc5629f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.21/clotch-agent-v0.2.21-linux-arm64.tar.gz"
      sha256 "90ff32da04157a8bf6576cb6afd8f6a2f9c9ae42a4ef1c884d341647bb28dd87"
    end
    on_intel do
      url "https://github.com/tuannvm/clotch/releases/download/v0.2.21/clotch-agent-v0.2.21-linux-amd64.tar.gz"
      sha256 "3d3cf65d8d219b77af093df3c3ab3e7e2492befeb3a1419abc8d5c5011f561b7"
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
