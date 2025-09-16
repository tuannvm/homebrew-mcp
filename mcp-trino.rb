# typed: false
# frozen_string_literal: true

# mcp-trino.rb
class McpTrino < Formula
  desc "MCP server for interacting with Trino clusters"
  homepage "https://github.com/tuannvm/mcp-trino"
  version "2.3.2"
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
      sha256 "67f9756aa8afcb8e9cf7cd852d92f831bbb8df39e9696bbdca839aa2af9047e0"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_arm64.tar.gz"
      sha256 "6ea74da6fc225dbcc6127840d357fab4b6cf433cbca1a5baa402ee3ccb81daa1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_amd64.tar.gz"
      sha256 "d74b28d27591bbf49642154a14d9c8c4a168a1f4bbc94f9f25a13e79875f4e27"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_arm64.tar.gz"
      sha256 "49b573d9ae102de3af0780a12394795e8a5856db2b31130ae4619844124b25ce"
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
