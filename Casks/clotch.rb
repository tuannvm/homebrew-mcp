cask "clotch" do
  version "0.1.0"
  sha256 "3a271dee4fd848f85ba1616783e4b41ea86c0306678a7ea69ebc6743ff7e1174"

  url "https://github.com/tuannvm/clotch/releases/download/v0.1.0/Clotch-v0.1.0-darwin-arm64.zip"
  name "Clotch"
  desc "Dynamic Island monitor for Claude Code sessions"
  homepage "https://github.com/tuannvm/clotch"

  depends_on formula: "tuannvm/mcp/clotch-agent"

  app "Clotch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Clotch.app"],
                   sudo: false
  end

  zap trash: [
    "~/.config/clotch/settings.json",
  ]

  caveats <<~EOS
    Start the session scanner agent:
      brew services start clotch-agent

    Then open Clotch from Applications or Spotlight.
  EOS
end
