cask "clotch" do
  version "0.2.16"
  sha256 "7aac83254399dc18ad032d98fdc1ac925f046e9762258994ef079f606ee34b67"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.16/Clotch-v0.2.16-darwin-arm64.zip"
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
