cask "clotch" do
  version "0.2.6"
  sha256 "b64faa0c2702e9a0b8550804be0b1d1330b2a50d8fd7737fc3104d17961d9a70"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.6/Clotch-v0.2.6-darwin-arm64.zip"
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
