require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5782.0.0-darwin-x64.tar.gz"
    sha256 "dfd4e2a3b6f1dcd9be062bb7ae0ab409c700d888e2de5b1f9c39d38309292463"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5782.0.0-darwin-arm64.tar.gz"
      sha256 "72546e3fa1ec26b7208e79910f571d3d45b5911843153478f27b9910478b6ebe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5782.0.0-linux-x64.tar.gz"
    sha256 "2530a01863b426401d276a20326592dd1d327ec066053a2f06451dc79a26d2b4"
  end
  version "5782.0.0"
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
