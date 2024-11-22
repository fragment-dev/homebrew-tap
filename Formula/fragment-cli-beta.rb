require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5826.0.0-darwin-x64.tar.gz"
    sha256 "7a9de7a3ea0a2951f0b2f3902209223398185e71b934904fce5fe10fd279be34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5826.0.0-darwin-arm64.tar.gz"
      sha256 "eeb01f28f6f273320b68d308ca2c164f1696711d41896dec79c5a1a31b3212c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5826.0.0-linux-x64.tar.gz"
    sha256 "f3b976d1c75ff6728969e79bdc63c88c5bee871ed18432d7b4f3542091f74e00"
  end
  version "5826.0.0"
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
