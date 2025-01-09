require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6051.0.0-darwin-x64.tar.gz"
    sha256 "d20e942500f3b314c7a25f475f916a7e1e7c77de0eb4962763c38b056c52c2d9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6051.0.0-darwin-arm64.tar.gz"
      sha256 "5eefab2df4001ace2a594acc45e2bd8301d1a3acc21f90169b1f83f869c59cd7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6051.0.0-linux-x64.tar.gz"
    sha256 "555d55265fcbcc0045a93cbbdec1e786feb3dd1837b13a9580d8554c527791d9"
  end
  version "6051.0.0"
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
