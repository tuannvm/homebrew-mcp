cask "clotch" do
  version "0.2.13"
  sha256 "cd9ffd9b85d8209b90b77a0de1f2822c622603fe7d5889273357d9df92d194c4"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.13/Clotch-v0.2.13-darwin-arm64.zip"
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
