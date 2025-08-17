# typed: false
# frozen_string_literal: true

# mcp-trino.rb
class McpTrino < Formula
  desc "MCP server for interacting with Trino clusters"
  homepage "https://github.com/tuannvm/mcp-trino"
  version "2.1.1"
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
      sha256 "16c0f83175e50007234485f2037ce202abd30b395acd6da61995b6e2c24fd8f7"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_arm64.tar.gz"
      sha256 "9995a03680dc81d1d7873756d8329cbe0b86dd371c8897babf19e45dc7400c07"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_amd64.tar.gz"
      sha256 "44f89f356f94f98818c786db48c851a22accce783872ceff99700e3a8d7cd8c6"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_arm64.tar.gz"
      sha256 "ccf9bf7e54042fdb00f2e93b67f422fdf49c849de8c3125c2d7945958da590a2"
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
