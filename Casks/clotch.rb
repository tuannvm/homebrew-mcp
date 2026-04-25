cask "clotch" do
  version "0.2.19"
  sha256 "60351774d72ad8ed094e815d2779cdf915d96c3f98271a8215423e7eddce213e"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.19/Clotch-v0.2.19-darwin-arm64.zip"
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
