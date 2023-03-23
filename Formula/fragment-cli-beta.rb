require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2266.0.0-darwin-x64.tar.gz"
    sha256 "205dc18ee5fff05de8f5c0967a15c68e4c0562abbd4e432ff958c6f1520aaf32"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2266.0.0-darwin-arm64.tar.gz"
      sha256 "c3ff18ce3e3c2af8987ccd0fde20e48a0406b53dc0e91f889489da58b381d43b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2266.0.0-linux-x64.tar.gz"
    sha256 "2dbb88708c93dc587b6fc6040f6418c75cd6e286c496b3c8c33782d3e10d5f01"
  end
  version "2266.0.0"
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
