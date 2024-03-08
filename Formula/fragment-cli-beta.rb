require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4727.0.0-darwin-x64.tar.gz"
    sha256 "b188667e551af4f056e8191462137b76b21a1bc31eb63e0c5bfe409e2a1c62e7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4727.0.0-darwin-arm64.tar.gz"
      sha256 "870da1d4de6689d015a2e085704bf64ee245733b2120c9e941a47d0797f849e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4727.0.0-linux-x64.tar.gz"
    sha256 "28a55a025ffbd332422d9b0b6549018462e5a1f49f45b33860d6d755f6f4b0b3"
  end
  version "4727.0.0"
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
