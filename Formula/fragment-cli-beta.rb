require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5123.0.0-darwin-x64.tar.gz"
    sha256 "54f9289dd981e39b3332f56ed4d3854163d1dcc2d6aef3f7bd3c791c2eddffc7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5123.0.0-darwin-arm64.tar.gz"
      sha256 "c3fa38b9b56dcb4bfc45ba168f85f5768fff2a0f92501e32d8c5a24c1901d7db"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5123.0.0-linux-x64.tar.gz"
    sha256 "077546bd9aade5d33760b264a90c313e5e285cc33384f3ad1d6ac4f082ea3772"
  end
  version "5123.0.0"
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
