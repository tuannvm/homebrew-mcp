cask "clotch" do
  version "0.2.7"
  sha256 "3449675d41d29067a20e59623631edc3a01dcb9a2c6193a720d8824ae5fa3484"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.7/Clotch-v0.2.7-darwin-arm64.zip"
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
