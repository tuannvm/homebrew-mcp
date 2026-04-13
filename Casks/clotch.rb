cask "clotch" do
  version "0.0.4"
  sha256 "e32122d6df8b14ad08269468f9d03e33e7ef0ee43536371dccb41db504a07e14"

  url "https://github.com/tuannvm/clotch/releases/download/v0.0.4/Clotch-v0.0.4-darwin-arm64.zip"
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
