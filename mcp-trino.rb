# typed: false
# frozen_string_literal: true

# mcp-trino.rb
class McpTrino < Formula
  desc "MCP server for interacting with Trino clusters"
  homepage "https://github.com/tuannvm/mcp-trino"
  version "1.2.0"
  license "MIT"
  
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_amd64.tar.gz"
      sha256 "93bdfd1ac180992cf5cc50ef28b527bb8b30403e9b20cbea018f2dea9ca28b0a" # Placeholder SHA256
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_arm64.tar.gz"
      sha256 "93bdfd1ac180992cf5cc50ef28b527bb8b30403e9b20cbea018f2dea9ca28b0a" # Placeholder SHA256
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_amd64.tar.gz"
      sha256 "93bdfd1ac180992cf5cc50ef28b527bb8b30403e9b20cbea018f2dea9ca28b0a" # Placeholder SHA256
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_arm64.tar.gz"
      sha256 "93bdfd1ac180992cf5cc50ef28b527bb8b30403e9b20cbea018f2dea9ca28b0a" # Placeholder SHA256
    end
  end

  def install
    bin.install "mcp-trino"
  end

  test do
    assert_match "mcp-trino version #{version}", shell_output("#{bin}/mcp-trino --version")
  end
end 
