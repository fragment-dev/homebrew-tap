require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2472.0.0-darwin-x64.tar.gz"
    sha256 "dd980f9702e4969d434718fc626bd0a91218b9cd2f2643b6d1ec42ef32b14078"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2472.0.0-darwin-arm64.tar.gz"
      sha256 "e32230a63a156de1b277aa1d2c409f0c6d3d8e9c6d1ae6af7b4baee0abfdbe6d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2472.0.0-linux-x64.tar.gz"
    sha256 "ba3b27eefe340dafa732846287985c5591c1400515b8ea9a3818461a902cc835"
  end
  version "2472.0.0"
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
