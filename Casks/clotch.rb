cask "clotch" do
  version "0.2.14"
  sha256 "d7c83b19a10f6105ff71da75931d015603c599a7078a5f453c63348020740833"

  url "https://github.com/tuannvm/clotch/releases/download/v0.2.14/Clotch-v0.2.14-darwin-arm64.zip"
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
