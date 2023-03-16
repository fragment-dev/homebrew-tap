require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2227.0.0-darwin-x64.tar.gz"
    sha256 "06233588debc53c9fee93c5ec01740e5e13af2eaf8a1733350ac910bd83deed3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2227.0.0-darwin-arm64.tar.gz"
      sha256 "11af3e464a13e148b8ca2c40bdd6d23702299730877344f53346a6b43bf74727"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2227.0.0-linux-x64.tar.gz"
    sha256 "05ddb6ddfd7d131e0e29881cc30e667d290677b278570bc8665ca817882c853b"
  end
  version "2227.0.0"
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
