# typed: false
# frozen_string_literal: true

# mcp-trino.rb
class McpTrino < Formula
  desc "MCP server for interacting with Trino clusters"
  homepage "https://github.com/tuannvm/mcp-trino"
  version "2.2.0"
  license "MIT"
  
  # Optional auto-update before installation
  option "with-auto-update", "Update the Homebrew formula before installation"
  
  # Use livecheck to help homebrew detect new versions
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_amd64.tar.gz"
      sha256 "85a6613c4a25d3d2bde64f8a99f5fafb2b63cf766e4c4a130dbab3c34f9ed9ab"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_arm64.tar.gz"
      sha256 "903f491b6b7d7c668e108a504cbba617cc969ddd9fdb76d1cac637ac9afa2de6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_amd64.tar.gz"
      sha256 "f9a5c9131029f08c3056f47e8c6797df34750518354e2c01d0f55aac76900144"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_arm64.tar.gz"
      sha256 "4a47b74bbf3232f44188d3dcb565a084e21d2c97abc3e4b713b785314e671ec7"
    end
  end

  def install
    # Auto-update before installation if requested
    if build.with? "auto-update"
      ohai "Updating tap 'tuannvm/mcp' to get the latest formula..."
      system "brew", "tap-update", "tuannvm/mcp"
    end
    
    bin.install "mcp-trino"
  end

  test do
    assert_match "mcp-trino version #{version}", shell_output("#{bin}/mcp-trino --version")
  end
end 
