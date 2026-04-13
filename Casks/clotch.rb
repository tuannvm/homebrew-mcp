cask "clotch" do
  version "0.0.6"
  sha256 "92976cf346fbed165c21d4d35faadaaf1fb305afeeebabe2dc60dcdce08861bc"

  url "https://github.com/tuannvm/clotch/releases/download/v0.0.6/Clotch-v0.0.6-darwin-arm64.zip"
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
