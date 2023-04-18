require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2470.0.0-darwin-x64.tar.gz"
    sha256 "e2019333daadc76bdf1382d9cf63ed92dc909917ac4ff6649386ebb06f12f4f7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2470.0.0-darwin-arm64.tar.gz"
      sha256 "d49241689b074ea12111fbeafb1f61266a62ad54cf33aae075a78a7d5a5592a2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2470.0.0-linux-x64.tar.gz"
    sha256 "71cda17ab7ab40fbecd36f757d64c1a46b9426369e36dd575363cb14a00a8d01"
  end
  version "2470.0.0"
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
