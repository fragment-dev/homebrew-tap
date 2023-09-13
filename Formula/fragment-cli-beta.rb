require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3549.0.0-darwin-x64.tar.gz"
    sha256 "a387a0f85627ba61d33dbeca81797257ca523b44504e5bcfd39138f98301d55c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3549.0.0-darwin-arm64.tar.gz"
      sha256 "6129186fa6e6c46f3801c4821d712c4a75b896dcbff369b05f90e1707cefc10c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3549.0.0-linux-x64.tar.gz"
    sha256 "5512b67c5d1fb27f14759772301a5c17a37883fef16d336e46b238c3b06b85d4"
  end
  version "3549.0.0"
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
