cask "clotch" do
  version "0.2.5"
  sha256 "d16b009c27cd8f9f7a50a7007d03ac8330ab5bcff931922592058ecb1df90a75"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.5/Clotch-v0.2.5-darwin-arm64.zip"
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
