require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5054.0.0-darwin-x64.tar.gz"
    sha256 "08447e4971ef9a026e2a32765d524669c2dc11cd8cb3b136302d5b42f93f10ac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5054.0.0-darwin-arm64.tar.gz"
      sha256 "688ab97b3134b51273b251d9abfe10d51c43104cfc2fbdf75f06c2ab0cc4bd5b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5054.0.0-linux-x64.tar.gz"
    sha256 "fe92b7c88ddf2c8a4776813c434107368cab0b1d532847edd8a499e97032f2c5"
  end
  version "5054.0.0"
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
