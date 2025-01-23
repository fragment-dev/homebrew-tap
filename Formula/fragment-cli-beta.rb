require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6121.0.0-darwin-x64.tar.gz"
    sha256 "758a0eeac4f85f433bcaab0482d78e6bf390b1bbb81f537712f166bac04412b0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6121.0.0-darwin-arm64.tar.gz"
      sha256 "d11e3a831c0e88cc5a17e5a2b8655e964355479885db386af2da87ca2893f181"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6121.0.0-linux-x64.tar.gz"
    sha256 "2f3f200c1751d70cf6e7d81523c5068a2d189e0416524af2269a5d597e4949bc"
  end
  version "6121.0.0"
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
