require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4829.0.0-darwin-x64.tar.gz"
    sha256 "5768eeda321b4ff899b2e7cbe78d237de1477cef30d99381facef19f6b174edf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4829.0.0-darwin-arm64.tar.gz"
      sha256 "77a6973722c6a3e0be8d53ec7898c6d57021a71d547939d781e851ade7ea37de"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4829.0.0-linux-x64.tar.gz"
    sha256 "12bbaf437c9d5f5467b71e4fd6dd3f7a89293e011c841909236cec8a4376e646"
  end
  version "4829.0.0"
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
