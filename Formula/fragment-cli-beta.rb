require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3895.0.0-darwin-x64.tar.gz"
    sha256 "0fa24471a220b76b4fb9a6baa6735913fe76ffebb09186d0c5c9cdfafed28666"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3895.0.0-darwin-arm64.tar.gz"
      sha256 "9ce3ed71c44bc760c96383dca00431b645aa5d248288b03565b120fc240e9a80"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3895.0.0-linux-x64.tar.gz"
    sha256 "884cba3babd915415bce045b8f30dd0f0986484c5e0d820b0b1cdb6ec2928d41"
  end
  version "3895.0.0"
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
