cask "clotch" do
  version "0.2.3"
  sha256 "7088a1f137be3c1c43e2031c2ee7569d50f11c650496f57b0afb8347ead64f97"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.3/Clotch-v0.2.3-darwin-arm64.zip"
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
