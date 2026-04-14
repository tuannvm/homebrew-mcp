cask "clotch" do
  version "0.1.4"
  sha256 "419e721c92ceb6f284ec83bbb0a133302330d8979bf2fdcdb4023d6ebadb28cf"

  url "https://github.com/tuannvm/clotch/releases/download/v0.1.4/Clotch-v0.1.4-darwin-arm64.zip"
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
