require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3727.0.0-darwin-x64.tar.gz"
    sha256 "3de945a9ba50e030e512d6f0a52b7d471543352faed437458df39ccf6d9e214c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3727.0.0-darwin-arm64.tar.gz"
      sha256 "630ddac9059936673389cf14d1bfdb91266ce775265b3b49e3cc788b20b50e3d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3727.0.0-linux-x64.tar.gz"
    sha256 "e0364065ef3a3588c2af0957a7117a91961e5a380ed1b72ae38f7c8c74d8fc7d"
  end
  version "3727.0.0"
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
