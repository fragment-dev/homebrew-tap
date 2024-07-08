require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5359.0.0-darwin-x64.tar.gz"
    sha256 "aff1acc136cc0d99a188f85e07b1c20854ee33fcf02b3788246a6d08c1e14eac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5359.0.0-darwin-arm64.tar.gz"
      sha256 "2a2d0ba8315dc428626f3eaa5509bef6fc11f7bc29932eb9276fc950fcfb4609"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5359.0.0-linux-x64.tar.gz"
    sha256 "0454e218ceccf5f232201367a684e82d3f13ce336a241918c9560f2c1f4dd621"
  end
  version "5359.0.0"
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
