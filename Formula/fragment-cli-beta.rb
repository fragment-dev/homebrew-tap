require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4873.0.0-darwin-x64.tar.gz"
    sha256 "0508911b29820329f06de4376e89f857365ef68aaac208751538e095061046cc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4873.0.0-darwin-arm64.tar.gz"
      sha256 "339007ad1c6acf761b1f5d408bb64b44b65732d100e65891b80e47af0003740d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4873.0.0-linux-x64.tar.gz"
    sha256 "93573778f807d4dbd821f4015325965b8d21d85d12be2222c362d5448be94549"
  end
  version "4873.0.0"
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
