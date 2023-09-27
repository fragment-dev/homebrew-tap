require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3682.0.0-darwin-x64.tar.gz"
    sha256 "93161903090727dc3b33e5dec2eb931be6614128b1862431e7c924bf2c796a44"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3682.0.0-darwin-arm64.tar.gz"
      sha256 "26548e18c584613710dbab38f1833048584b40bd9f1d80460ae16eff75ecec83"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3682.0.0-linux-x64.tar.gz"
    sha256 "01e4f9caa567d8c16a0ba3759c6fd2412bd4c52da9f1ab612bb42f917afe4174"
  end
  version "3682.0.0"
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
