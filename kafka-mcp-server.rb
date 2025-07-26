  class KafkaMcpServer < Formula
    desc "kafka-mcp-server - Add description here"
    homepage "https://github.com/tuannvm/kafka-mcp-server"
    version "1.0.5"
    license "Apache-2.0"
  
    on_macos do
      on_arm do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.5/kafka-mcp-server_1.0.5_darwin_arm64.tar.gz"
        sha256 "53c2dd0515a2e7e61eb83c9d86495c2b85aac2094d7e5c558660eaec59ef1428"
      end
      on_intel do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.5/kafka-mcp-server_1.0.5_darwin_amd64.tar.gz"
        sha256 "b2a26ef13f285bce5259c6e172cf3dd2eb0ea36b4844f14a6387b9306d4dbf2f"
      end
    end
  
    on_linux do
      on_arm do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.5/kafka-mcp-server_1.0.5_linux_arm64.tar.gz"
        sha256 "27a8b929f412b38b1609ee1555e1f6b9bce8a0f7a95352221651d4c6dba3c28d"
      end
      on_intel do
        url "https://github.com/tuannvm/kafka-mcp-server/releases/download/v1.0.5/kafka-mcp-server_1.0.5_linux_amd64.tar.gz"
        sha256 "47fc063af304bdf895fd38a5ce4dabc2be11c6a67cf1aaff629e56ad7a5b542e"
      end
    end
  
    def install
      bin.install "kafka-mcp-server"
    end
  
    test do
      system "#{bin}/kafka-mcp-server", "--version"
    end
  end
