require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.23-1-darwin-x64.tar.gz"
    sha256 "1281c9016c80b361833bf58eaa23743c2b9cd2e6e4e1729d5a358f49728b90cb"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.23-1-darwin-arm64.tar.gz"
      sha256 "d548f06078d8f0a9795c4adb89b49bd55f9522a3b13e094aae79db7d39809139"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.23-1-linux-x64.tar.gz"
    sha256 "a88e80b6a8ff103c35d6c6bc2e8996484896226f080245f74f3180dd8abb8411"
  end
  version "2024.7.23-1"
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
