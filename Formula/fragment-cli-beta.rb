require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4312.0.0-darwin-x64.tar.gz"
    sha256 "2b1bd8bdf549645829950ff6a6e9e40b2b32f07e8422b2dda18ddc1342d913d9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4312.0.0-darwin-arm64.tar.gz"
      sha256 "98729f88587c3a9e7f321f667817f5eb271a1a7f75a55091253c6bd2aca736f6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4312.0.0-linux-x64.tar.gz"
    sha256 "1c6f15ff6ecaa793383110cb7692fcdf6ac1c1c3ffe67e28e9ea37d00d06207d"
  end
  version "4312.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
