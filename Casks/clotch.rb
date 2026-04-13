cask "clotch" do
  version "0.1.2"
  sha256 "a9a7faf3dd6b023f43b9436107e6dd4d371dff537b6d5654a35a6eef2f31ff1f"

  url "https://github.com/tuannvm/clotch/releases/download/v0.1.2/Clotch-v0.1.2-darwin-arm64.zip"
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
