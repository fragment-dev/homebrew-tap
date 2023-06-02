require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2785.0.0-darwin-x64.tar.gz"
    sha256 "1b576d8181124f37f0319917446456a0d9dfc604ff7390716c42fee608d52849"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2785.0.0-darwin-arm64.tar.gz"
      sha256 "2d3a5f88bf420caa53cd4788d1704288537b48731bf333be26d80d311d0f0fd2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2785.0.0-linux-x64.tar.gz"
    sha256 "1fde12296d286eb09b6f2480eaa457bf412b1a43803acef6b02b1b6e01113ce2"
  end
  version "2785.0.0"
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
