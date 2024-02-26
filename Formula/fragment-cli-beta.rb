require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4636.0.0-darwin-x64.tar.gz"
    sha256 "6cfbf5eef967deb3920734979db9522da5cc4ab3d0a621e8142d80fdd9bedcb0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4636.0.0-darwin-arm64.tar.gz"
      sha256 "65b5a16ca9fe38165e10edd1a4136338e00f9c3141780d00e855a0d75c479ba0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4636.0.0-linux-x64.tar.gz"
    sha256 "3d7dca9729ba60c28800d94902c3adadbc5e38a52fe28f9ad0c245f43667da50"
  end
  version "4636.0.0"
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
