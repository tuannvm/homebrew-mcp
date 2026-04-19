cask "clotch" do
  version "0.2.11"
  sha256 "8e32592402e35ce509471b505e0e154bfe5b4b27d369920c816f1920ca3cf4d5"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.11/Clotch-v0.2.11-darwin-arm64.zip"
  name "Clotch"
  desc "Dynamic Island monitor for Claude Code sessions"
  homepage "https://github.com/tuannvm/clotch"

  depends_on formula: "tuannvm/mcp/clotch-agent"

  app "Clotch.app"

  zap trash: [
    "~/.config/clotch/settings.json",
  ]

  caveats <<~EOS
    Start the session scanner agent:
      brew services start clotch-agent

    Then open Clotch from Applications or Spotlight.
  EOS
end
