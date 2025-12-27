class Pagent < Formula
  desc "pagent - Add description here"
  homepage "https://github.com/tuannvm/pagent"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tuannvm/pagent/releases/download/v0.1.1/pagent_0.1.1_darwin_arm64.tar.gz"
      sha256 "804975fd50cc0c011204314e7f545e066b894812bd6e5cb11da38cee98c4103a"
    end
    on_intel do
      url "https://github.com/tuannvm/pagent/releases/download/v0.1.1/pagent_0.1.1_darwin_amd64.tar.gz"
      sha256 "d96f1a6e7381432c51a0132c0dd437b305a66cdb54f78d3dd19f58378c6e9e93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tuannvm/pagent/releases/download/v0.1.1/pagent_0.1.1_linux_arm64.tar.gz"
      sha256 "a3e1bdbb96c391c352c32d16a5b5b02993a5ff8ba61e78db9f25786f4477d192"
    end
    on_intel do
      url "https://github.com/tuannvm/pagent/releases/download/v0.1.1/pagent_0.1.1_linux_amd64.tar.gz"
      sha256 "19ecc91c6d55dcae77e81c40492229432ab1d34cf7559ad89023b37d44266c12"
    end
  end

  def install
    bin.install "pagent"
  end

  test do
    system bin/"pagent", "--version"
  end
end
