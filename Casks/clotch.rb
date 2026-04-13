cask "clotch" do
  version "0.0.5"
  sha256 "df8d7da422838983459a1c89e1582ddaf6bd6f6fe9e8a342ab9c1aef768b1738"

  url "https://github.com/tuannvm/clotch/releases/download/v0.0.5/Clotch-v0.0.5-darwin-arm64.zip"
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
