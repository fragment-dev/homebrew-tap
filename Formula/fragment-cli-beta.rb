require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5376.0.0-darwin-x64.tar.gz"
    sha256 "7aeb1cf3bad189a5910efc6aa197e2260ebdc5514497dcd0fdd7c2b5a00b53f5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5376.0.0-darwin-arm64.tar.gz"
      sha256 "2306b44ecc034f68fb3f915965b8cedab64ece480f26bf1af77606e0598a3262"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5376.0.0-linux-x64.tar.gz"
    sha256 "c8146f74165c527a1042175fc81a07db389ab13c8a45cd8ffbf60249d6b2b7c9"
  end
  version "5376.0.0"
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
