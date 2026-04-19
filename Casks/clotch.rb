cask "clotch" do
  version "0.2.12"
  sha256 "cb31ef9fc0099a214266b3b0d2833017c05ac6c95cc1f48932770a5958bc557c"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.12/Clotch-v0.2.12-darwin-arm64.zip"
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
