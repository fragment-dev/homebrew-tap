require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5437.0.0-darwin-x64.tar.gz"
    sha256 "a862a8e315730aa252df6759decb6329dd0acf495e30b66a6c96703751ae02b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5437.0.0-darwin-arm64.tar.gz"
      sha256 "378a13e500460dbd6c24e58babe3848862d4b2a147a1106ce93ad6d24cd4b089"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5437.0.0-linux-x64.tar.gz"
    sha256 "e895b35a89dec85da0eb6b2e422e85c46cbcb3713831d4cfeff2fa967e9af1dc"
  end
  version "5437.0.0"
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
