  class KafkaMcpServer < Formula
    desc "kafka-mcp-server - Add description here"
    homepage "https://github.com/tuannvm/kafka-mcp-server"
    version "1.0.3"
    license "Apache-2.0"
  
    on_macos do
      on_arm do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.3/kafka-mcp-server_1.0.3_darwin_arm64.tar.gz"
        sha256 "3c4d19889f136e5554dc15c7e86846f88b112aefce5654fdc291b1baffd5a3ea"
      end
      on_intel do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.3/kafka-mcp-server_1.0.3_darwin_amd64.tar.gz"
        sha256 "fa2714ec9d4a81e6f20f729b40390f3543675c180eca623f8f888cece2b2ea5d"
      end
    end
  
    on_linux do
      on_arm do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.3/kafka-mcp-server_1.0.3_linux_arm64.tar.gz"
        sha256 "751a6aaec9fb09ccef884a9845a2b1275fd6cda87cb104ef79c2bf7fc2d3cb11"
      end
      on_intel do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.3/kafka-mcp-server_1.0.3_linux_amd64.tar.gz"
        sha256 "91855cc129fa07a550db706c0cabe485c9cef892f767cc03935a7f42e0af8237"
      end
    end
  
    def install
      bin.install "kafka-mcp-server"
    end
  
    test do
      system "#{bin}/kafka-mcp-server", "--version"
    end
  end
