  class HaproxyMcpServer < Formula
    desc "haproxy-mcp-server - Add description here"
    homepage "https://github.com/tuannvm/haproxy-mcp-server"
    version "1.0.10"
    license "Apache-2.0"
  
    on_macos do
      on_arm do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_darwin_arm64.tar.gz"
        sha256 "200a25d232f86f84e4f152507d7215c6fc2873e88bafdf39e93152138d004d93"
      end
      on_intel do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_darwin_amd64.tar.gz"
        sha256 "14e96b414921af277b45347f335489a1536fa434e0dd338636b520a49db7f1b5"
      end
    end
  
    on_linux do
      on_arm do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_linux_arm64.tar.gz"
        sha256 "316488eade592bbe6ca1fa8bb81adcd8756cdcde90c030f6a3636fc86c4392dd"
      end
      on_intel do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_linux_amd64.tar.gz"
        sha256 "342ea916d29861595a45fdde19874e315b97c0d3f0f59e79e9e80a5988d92481"
      end
    end
  
    def install
      bin.install "haproxy-mcp-server"
    end
  
    test do
      system "#{bin}/haproxy-mcp-server", "--version"
    end
  end
