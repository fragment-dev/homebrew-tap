require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3716.0.0-darwin-x64.tar.gz"
    sha256 "da9971f39e51c4ac95fe078d6521691d3c4bd19fcfb2491839e53fd533d37b87"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3716.0.0-darwin-arm64.tar.gz"
      sha256 "5be223eea21e3cfcf891bd8ce8e7565dcb2e30efa7d4147bcd0b92b77db9a816"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3716.0.0-linux-x64.tar.gz"
    sha256 "90ca7d0e51e09ca2fe61ec3fd672f567a563d3fab4512b90c9f3687d4d0086ae"
  end
  version "3716.0.0"
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
