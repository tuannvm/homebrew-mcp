# typed: false
# frozen_string_literal: true

# mcp-trino.rb
class McpTrino < Formula
  desc "MCP server for interacting with Trino clusters"
  homepage "https://github.com/tuannvm/mcp-trino"
  version "1.3.1"
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
      sha256 "b1075a764a15ee251bc07ca3a72edcd808af6d1e8a5ac8bc965da7d7ed001ffc"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_arm64.tar.gz"
      sha256 "5e93658ba4e99cd44fa02b3a823f3b242722dca348ebcf16ed63f48fdbaa7613"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_amd64.tar.gz"
      sha256 "2af29381977c8f17a20c197ebfafe24757e6b06831707ca648f809449e6bcadc"
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_arm64.tar.gz"
      sha256 "63f0d7dea5ff0e3e287122cbcf324226fcc09e8f2da211ea68c5272b3ea78cf1"
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
