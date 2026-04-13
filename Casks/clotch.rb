cask "clotch" do
  version "0.1.3"
  sha256 "3a51764a9b55ebbbee46ebd41e6e4bc48f0d5772f0e784028ef911e1da1daf88"

  url "https://github.com/tuannvm/clotch/releases/download/v0.1.3/Clotch-v0.1.3-darwin-arm64.zip"
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
