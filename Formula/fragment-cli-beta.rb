require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6085.0.0-darwin-x64.tar.gz"
    sha256 "f956751b3ddb24985dcbc55a295e4fdf564a94957a94f2d13e0fdc8bc86f7219"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6085.0.0-darwin-arm64.tar.gz"
      sha256 "35ab15ccd86ac6cdb9e193b0220b441a42053943749cdc6bf47eb5f8e20b58cd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6085.0.0-linux-x64.tar.gz"
    sha256 "91222fd71cafd1810bf904685a2e43731cbf92ee26ff887fa6b56b5c0e4e26c1"
  end
  version "6085.0.0"
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
