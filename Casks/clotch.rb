cask "clotch" do
  version "0.2.1"
  sha256 "8ee721a24c21eb169c540ca432fd0d03f0d113977dc37acac0a309f311ee10d3"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.1/Clotch-v0.2.1-darwin-arm64.zip"
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
