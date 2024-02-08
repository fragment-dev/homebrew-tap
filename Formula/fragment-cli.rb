require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.7-1-darwin-x64.tar.gz"
    sha256 "2ebdbce51901ea0c871c3ac8081557d9860411d2b5928632fa90fd8086a32ad6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.7-1-darwin-arm64.tar.gz"
      sha256 "01a686643ef62b103d87daea636446b41626d09bac9b325bdb9cf47d0138dde6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.7-1-linux-x64.tar.gz"
    sha256 "b18f95f2cf74d34a1629376eb3130e2b610565b6f7075d8e1842ea0774933380"
  end
  version "2024.2.7-1"
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
