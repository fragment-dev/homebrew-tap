require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5980.0.0-darwin-x64.tar.gz"
    sha256 "d1abba888d57fcc25d4392a6a1d7aeec654524fbf49489705440fde655fa9b63"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5980.0.0-darwin-arm64.tar.gz"
      sha256 "56f51e0c6a2dc60229064fe20f34f34a950c4c2984939894d3b1a54139026010"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5980.0.0-linux-x64.tar.gz"
    sha256 "3538d7ad1b5c8cd9d6069e4e75eee191d08278167ea4f67462211bdae4bdb0e9"
  end
  version "5980.0.0"
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
