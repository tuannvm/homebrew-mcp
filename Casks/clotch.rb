cask "clotch" do
  version "0.2.18"
  sha256 "6ab9ce278ad59a06ae69c2353283da669352043193303dcee71f105b831d7040"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.18/Clotch-v0.2.18-darwin-arm64.zip"
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
