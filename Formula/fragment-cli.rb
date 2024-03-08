require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.7-1-darwin-x64.tar.gz"
    sha256 "52a40c7726aef870f768b36b1953201e32abc04b548e8619f10b610f5c617633"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.7-1-darwin-arm64.tar.gz"
      sha256 "26cc7994f583beac5267897c0893a861214fbf2f3549271ed60e37f046de3812"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.7-1-linux-x64.tar.gz"
    sha256 "5015106fd16d18fd1772bfe13eec383abe875626a6295804fd3bbff2c8848cc6"
  end
  version "2024.3.7-1"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
