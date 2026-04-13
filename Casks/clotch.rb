cask "clotch" do
  version "0.1.1"
  sha256 "72df6a44e032f53cb8f9de732754dff9a935ea71e24746cb8e66ad0bda71ad37"

  url "https://github.com/tuannvm/clotch/releases/download/v0.1.1/Clotch-v0.1.1-darwin-arm64.zip"
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
