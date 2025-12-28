class Pagent < Formula
  desc "pagent - Add description here"
  homepage "https://github.com/tuannvm/pagent"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/pagent/releases/download/v0.1.2/pagent_0.1.2_darwin_arm64.tar.gz"
      sha256 "b2fa83c39e550e68b28f4278e5f2903d1b8eae359bb8414dcaa4054b3249d255"
    end
    on_intel do
      url "https://github.com/tuannvm/pagent/releases/download/v0.1.2/pagent_0.1.2_darwin_amd64.tar.gz"
      sha256 "61339b2ea3cca905bbe610408cf2ba394dc12ec2b0eea155d83dfc3100ab4154"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/pagent/releases/download/v0.1.2/pagent_0.1.2_linux_arm64.tar.gz"
      sha256 "696a67aa521e2e78aa8993e5f91bc931f2b548dbbdc913b592d70dbaa1eeb401"
    end
    on_intel do
      url "https://github.com/tuannvm/pagent/releases/download/v0.1.2/pagent_0.1.2_linux_amd64.tar.gz"
      sha256 "840e89f7561401a96c13dcd3a348a32bb8a3de9c227a4ff805d3f80c0ab1a905"
    end
  end

  def install
    bin.install "pagent"
  end

  test do
    system bin/"pagent", "--version"
  end
end
