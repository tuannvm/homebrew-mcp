cask "clotch" do
  version "0.2.0"
  sha256 "f5fd51bb9acad501bcac4aac1f1e3f7732643dd1109fa7e9f28242e56fa22e5c"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.0/Clotch-v0.2.0-darwin-arm64.zip"
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
