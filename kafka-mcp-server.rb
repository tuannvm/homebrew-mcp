  class KafkaMcpServer < Formula
    desc "kafka-mcp-server - Add description here"
    homepage "https://github.com/tuannvm/kafka-mcp-server"
    version "1.0.2"
    license "Apache-2.0"
  
    on_macos do
      on_arm do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.0/kafka-mcp-server_1.0.0_darwin_arm64.tar.gz"
        sha256 "e24f047af2f9f33e7f5f6b4b656bbfd1a375140d7ca999619d53a06d1997f1af"
      end
      on_intel do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.0/kafka-mcp-server_1.0.0_darwin_amd64.tar.gz"
        sha256 "826f32d9a0bbf197d500cc0712e7ec78047da7fef7c0b220b8051f6a44545b50"
      end
    end
  
    on_linux do
      on_arm do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.0/kafka-mcp-server_1.0.0_linux_arm64.tar.gz"
        sha256 "a5b2d98ed6cf3b0b4575ec79009cd42e818d649b301fae2c028e10156b3c9afd"
      end
      on_intel do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.0/kafka-mcp-server_1.0.0_linux_amd64.tar.gz"
        sha256 "81e66ed1d1ee99383b4878ea29eca9faef7363da1f1d049b6d974dced6d8f467"
      end
    end
  
    def install
      bin.install "kafka-mcp-server"
    end
  
    test do
      system "#{bin}/kafka-mcp-server", "--version"
    end
  end
