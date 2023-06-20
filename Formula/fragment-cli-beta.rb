require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2876.0.0-darwin-x64.tar.gz"
    sha256 "2c98754e282889a85cd0eabcbf4d6850cab0f956e05afe3c3f2597303a4d11e4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2876.0.0-darwin-arm64.tar.gz"
      sha256 "e2ab8d871f6c96152cce3ebd634b722cc2d7a395f18225a4e5a02b0a0576c8a0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2876.0.0-linux-x64.tar.gz"
    sha256 "09914e4b3c9de376bb653176c990f41a4ebafd93e4327e760f853fb22d3ee1bf"
  end
  version "2876.0.0"
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
