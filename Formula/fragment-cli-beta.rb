require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2510.0.0-darwin-x64.tar.gz"
    sha256 "abfead756b29f7275ba55408d25df5a1198c34a67b249aa1ee8e0e067a52e552"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2510.0.0-darwin-arm64.tar.gz"
      sha256 "578cd3f91e433fb2adee51efbd554c1f907731399c9545a1d01dbd2544d901ee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2510.0.0-linux-x64.tar.gz"
    sha256 "14bfdaef0284d0de7affe212c18cab3442fb8281749926b1b42d1e6486284c9a"
  end
  version "2510.0.0"
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
