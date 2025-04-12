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
      sha256 "0abdfbefe48c45e1a4ce80e55a105fceae90a728c8b8fb79712bfd4d3ae83adb" # Placeholder SHA256
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_arm64.tar.gz"
      sha256 "385df34c1288763eeeaf515990c4221dd906b735dd94f2cc56fecdec96b3d6d5" # Placeholder SHA256
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_amd64.tar.gz"
      sha256 "b01c9dde600f531b10d61afa2fce2476a445d4b46ef828aa3f29b1f6a7597977" # Placeholder SHA256
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
