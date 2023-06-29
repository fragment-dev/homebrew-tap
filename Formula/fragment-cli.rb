require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.29-1-darwin-x64.tar.gz"
    sha256 "c23e24705c4110040af7c23d67978e495c657ab396487d5c0a409469a1171529"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.29-1-darwin-arm64.tar.gz"
      sha256 "5b7f5dc2d8a9cc548f3f09df01ec387cc9daaa013f311b02d3182f15382027a0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.29-1-linux-x64.tar.gz"
    sha256 "1fa893e7388a87c57647c31acda1b1374cc9fa647a52e3e45516ecf790cdcbaa"
  end
  version "2023.6.29-1"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
