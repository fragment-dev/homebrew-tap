require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4977.0.0-darwin-x64.tar.gz"
    sha256 "8777c1643adafedd425ae8cc5292aa20aecfedf81e5c5d4d3e0d88d3d86278a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4977.0.0-darwin-arm64.tar.gz"
      sha256 "d24920e1637ceefdb9781903372085d23f2ed54c37ec7ebe1188b3a4a93c7884"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4977.0.0-linux-x64.tar.gz"
    sha256 "c1e6caeeda25f463b237a38443e0008349cdd0f45371a8c86621e157ca63abbd"
  end
  version "4977.0.0"
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
