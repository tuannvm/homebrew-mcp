cask "clotch" do
  version "0.2.15"
  sha256 "8989b1c8eb233a9cba2da40884574311ec10591478485b3fee8c8b5be7eeb4a8"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.15/Clotch-v0.2.15-darwin-arm64.zip"
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
