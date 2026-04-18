cask "clotch" do
  version "0.2.9"
  sha256 "eba98d3f4bdee544ed2c1bfe4f5c9befce9e301a9aa0e02294c62ac8aaf5b989"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.9/Clotch-v0.2.9-darwin-arm64.zip"
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
