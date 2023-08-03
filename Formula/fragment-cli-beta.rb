require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3227.0.0-darwin-x64.tar.gz"
    sha256 "0603175317f96dfb127fedc1e0e83292e84a83b9ad686087d7d2c62ffb093896"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3227.0.0-darwin-arm64.tar.gz"
      sha256 "7a0af7106f40595684b7a481e64c6cfe559dd9b2be5697b32a936f51c2d8bf33"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3227.0.0-linux-x64.tar.gz"
    sha256 "70e78076c32651aad6ffbf8b740d4dcb55efbfa602893e9ec8e33b3c8330f9ee"
  end
  version "3227.0.0"
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
