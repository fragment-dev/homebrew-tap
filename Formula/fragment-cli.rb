require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.4-darwin-x64.tar.gz"
    sha256 "663779ec8289d7d1e36ff12f43d2347c7f8eb9c36176c1ea0a020f24189cb7bf"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.4-darwin-arm64.tar.gz"
      sha256 "d98ccfb048ea877abd08db3865ad02ab33d4b967b4d0b1f8339d77cded45bd46"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.4-linux-x64.tar.gz"
    sha256 "2e6edb5e0602c2b5ee760a74bf5e8c792df67c733a0fb62c6b870a5ce7757d02"
  end
  version "2024.11.4"
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
