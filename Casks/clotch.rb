cask "clotch" do
  version "0.2.22"
  sha256 "7e4763f14a86ba4e4ebca331e6fea8d7f44f415f3e5689ff3889a9a7f0a9d8d4"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.22/Clotch-v0.2.22-darwin-arm64.zip"
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
