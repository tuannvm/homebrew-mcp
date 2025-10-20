# typed: false
# frozen_string_literal: true

# mcp-trino.rb
class McpTrino < Formula
  desc "MCP server for interacting with Trino clusters"
  homepage "https://github.com/tuannvm/mcp-trino"
  version "4.0.0"
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
      sha256 "18fe68435f529a0658a02bebfa373c5a6ea5d150a13f957ff01c0e5c6db9773b"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_arm64.tar.gz"
      sha256 "db205feb40b40453414c1fa4bc70b0be014e019559911a0ce339fcedd576eba0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_amd64.tar.gz"
      sha256 "4d2b0e509cccce318dd946971da9c41a9bacc7a5080601746d26d725ffdc64a3"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_arm64.tar.gz"
      sha256 "4781fb5600f7b4880f5490aa13cb46039929a792e25528096a9ae4500dd90371"
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
