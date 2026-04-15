cask "clotch" do
  version "0.2.2"
  sha256 "196dfa0deb8fd5847fae6b7a3cd4c286e7105626cd094c3982aa080abd92b310"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.2/Clotch-v0.2.2-darwin-arm64.zip"
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
