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
      # IMPORTANT: sha256 must be updated for each new release.
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Placeholder SHA256
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_darwin_arm64.tar.gz"
      # IMPORTANT: sha256 must be updated for each new release.
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Placeholder SHA256
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_amd64.tar.gz"
      # IMPORTANT: sha256 must be updated for each new release.
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Placeholder SHA256
    end
    on_arm do
      url "https://github.com/tuannvm/mcp-trino/releases/latest/download/mcp-trino_#{version}_linux_arm64.tar.gz"
      # IMPORTANT: sha256 must be updated for each new release.
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Placeholder SHA256
    end
  end

  # No build step needed as we are downloading binaries.
  def build
    raise "Formula is designed to install pre-compiled binaries and does not support building from source."
  end

  def install
    # The downloaded tar.gz should contain the binary named 'mcp-trino'.
    bin.install "mcp-trino"
  end

  test do
    assert_match "mcp-trino version #{version}", shell_output("#{bin}/mcp-trino --version")
  end
end 