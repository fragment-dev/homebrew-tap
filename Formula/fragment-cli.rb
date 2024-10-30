require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.29-darwin-x64.tar.gz"
    sha256 "7f2a37396830b258e3eb533dc9b97962532240f0be4e0b9563a46a62f1190be4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.29-darwin-arm64.tar.gz"
      sha256 "d9cd78fb33f18f4df52e8dfd8bccd41ba3889a1180241df82419e4702a41c011"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.29-linux-x64.tar.gz"
    sha256 "3aa7700e8c7f5597b7378e53974ffd5fd9d766687a24a116190f77761a6f35be"
  end
  version "2024.10.29"
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
