require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4755.0.0-darwin-x64.tar.gz"
    sha256 "69525ab5e1f124e76b4a053243b06af514692f77852c1e9b5868ba8b2abf8767"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4755.0.0-darwin-arm64.tar.gz"
      sha256 "b33da98027127ea10a637f9fc0c4949457c84c4a1c07a367b43a31a3e6046bf5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4755.0.0-linux-x64.tar.gz"
    sha256 "e5c7263cccd839ee360212eae119954acce3027b4b55a7c89a938d8dac8f6ac6"
  end
  version "4755.0.0"
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
