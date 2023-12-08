require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4114.0.0-darwin-x64.tar.gz"
    sha256 "870eaee1dccec20c89bcd6ef98ff299dfc4d0200523db195d473a45970486b08"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4114.0.0-darwin-arm64.tar.gz"
      sha256 "10d7d2da77722f6ee22181266dd319a5c87ff0c819016e40ffa5648896fa6c97"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4114.0.0-linux-x64.tar.gz"
    sha256 "cdf54e2cc412fe05112552ad41f6ab6928fe6442a56a8268efa86974c7dbd53a"
  end
  version "4114.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
