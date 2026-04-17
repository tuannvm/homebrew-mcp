cask "clotch" do
  version "0.2.8"
  sha256 "5d95728e536ae473c45fc0f924fc95d439f627d7e739f131084803e5b7574bb2"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.8/Clotch-v0.2.8-darwin-arm64.zip"
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
