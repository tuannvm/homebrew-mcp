  class HaproxyMcpServer < Formula
    desc "haproxy-mcp-server - Add description here"
    homepage "https://github.com/tuannvm/haproxy-mcp-server"
    version "1.0.11"
    license "Apache-2.0"
  
    on_macos do
      on_arm do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_darwin_arm64.tar.gz"
        sha256 "8358a378e204743dc94721fe9703d4611a5a54be2e174571cdf9f958b55117f5"
      end
      on_intel do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_darwin_amd64.tar.gz"
        sha256 "27fd841465351de5a692bed38d86905cf9465bf76222f7784bb0d0d20e847810"
      end
    end
  
    on_linux do
      on_arm do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_linux_arm64.tar.gz"
        sha256 "7a19737fd2ccf93baeb6fb6f5c02d2836002fd85db59a5100f7227b373759c79"
      end
      on_intel do
        url "https://github.com/tuannvm/haproxy-mcp-server/releases/download/v1.0.0/haproxy-mcp-server_1.0.0_linux_amd64.tar.gz"
        sha256 "9286af79f64092e0aedfdb7823dc4ccb68c5aadb4b1345aa6e273979df4ce2c4"
      end
    end
  
    def install
      bin.install "haproxy-mcp-server"
    end
  
    test do
      system "#{bin}/haproxy-mcp-server", "--version"
    end
  end
