require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2735.0.0-darwin-x64.tar.gz"
    sha256 "c766f31393eb7fbb9473309b07081152ab3b71db9ece81ee5072bf4c86f75bf6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2735.0.0-darwin-arm64.tar.gz"
      sha256 "64dca90be3d43996d802904c654c1ec2510d5695a659895a9c92da3780aea73e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2735.0.0-linux-x64.tar.gz"
    sha256 "bbae4f7b65ee4945fa0c52c60919907aaa25890cdd7993bbf5fc4a21590d98c0"
  end
  version "2735.0.0"
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
