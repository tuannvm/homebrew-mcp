  class HaproxyMcpServer < Formula
    desc "haproxy-mcp-server - Add description here"
    homepage "https://github.com/tuannvm/haproxy-mcp-server"
    version "1.0.12"
    license "Apache-2.0"
  
    on_macos do
      on_arm do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_darwin_arm64.tar.gz"
        sha256 "a74fdee5314f820b030837a2427a6f839117d83247aaf04a7a234b277e80a6ad"
      end
      on_intel do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_darwin_amd64.tar.gz"
        sha256 "0af4673113d9734ffac3ab2014205d89386ad4839665311b168170f709d3d3ee"
      end
    end
  
    on_linux do
      on_arm do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_linux_arm64.tar.gz"
        sha256 "13d9004270249d588dfa8d386b6d4e9726c4819ffe3a5fef2ff477a2d8aa1faf"
      end
      on_intel do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_linux_amd64.tar.gz"
        sha256 "ca74e9d32b4fde4a46d015b481464a56ec79019dc55bcbf7e327358d28b8b125"
      end
    end
  
    def install
      bin.install "haproxy-mcp-server"
    end
  
    test do
      system "#{bin}/haproxy-mcp-server", "--version"
    end
  end
