  class KafkaMcpServer < Formula
    desc "kafka-mcp-server - Add description here"
    homepage "https://github.com/tuannvm/kafka-mcp-server"
    version "1.0.0"
    license "Apache-2.0"
  
    on_macos do
      on_arm do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.0/kafka-mcp-server_1.0.0_darwin_arm64.tar.gz"
        sha256 "433b3ed255cd3590c339e7b865932b868aa2497a773b85419565416b7863c937"
      end
      on_intel do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.0/kafka-mcp-server_1.0.0_darwin_amd64.tar.gz"
        sha256 "7e4051b1c4224b05696cb5fad7e6d3aee78b7f55edf101c0afa1a5986134ce55"
      end
    end
  
    on_linux do
      on_arm do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.0/kafka-mcp-server_1.0.0_linux_arm64.tar.gz"
        sha256 "5e4d57afbf2c895aa40eec985a742a52f1a5df865d912e852f9ae182e6788617"
      end
      on_intel do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.0/kafka-mcp-server_1.0.0_linux_amd64.tar.gz"
        sha256 "89db569db6ccbda487c9d6e8c0342e93c0681a4af6ab85f735b26b269515d46f"
      end
    end
  
    def install
      bin.install "kafka-mcp-server"
    end
  
    test do
      system "#{bin}/kafka-mcp-server", "--version"
    end
  end
