  class HaproxyMcpServer < Formula
    desc "haproxy-mcp-server - Add description here"
    homepage "https://github.com/tuannvm/haproxy-mcp-server"
    version "1.0.0"
    license "Apache-2.0"
  
    on_macos do
      on_arm do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_darwin_arm64.tar.gz"
        sha256 "92dd0a14cb9705d38019554c1c8c3417420d67cf7a5e50121431c230ce2c3efa"
      end
      on_intel do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_darwin_amd64.tar.gz"
        sha256 "ee8f7cb99cfb9636aa5a8eb9d1d84b140fa547bb97c7b1de90218c1344c4c258"
      end
    end
  
    on_linux do
      on_arm do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_linux_arm64.tar.gz"
        sha256 "07fd3282c84a7dedce28f2060c94bb7157c53cfd3129d82d0bd73152b51995ad"
      end
      on_intel do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_linux_amd64.tar.gz"
        sha256 "ec18aa69ed2487a7958e73da2b0ddc9b26de5955af02e49d223a859a5e0e9704"
      end
    end
  
    def install
      bin.install "haproxy-mcp-server"
    end
  
    test do
      system "#{bin}/haproxy-mcp-server", "--version"
    end
  end
