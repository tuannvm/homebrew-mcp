cask "clotch" do
  version "0.2.4"
  sha256 "20f6c7fb3ea30cafe4100d684354fe5422ef0ddc4db6a568a5131fde10f72fd3"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.4/Clotch-v0.2.4-darwin-arm64.zip"
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
