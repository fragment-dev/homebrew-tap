require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.23-1-darwin-x64.tar.gz"
    sha256 "fcf8d36fd48987a3bd62a77a6cc85392340c73d8d904422e4a3e68042ca2130a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.23-1-darwin-arm64.tar.gz"
      sha256 "209687529af5215a20b6d4e1d7d7396b17d8149dcf7d2ee2a71a4a6255e51073"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.23-1-linux-x64.tar.gz"
    sha256 "876865de96316196eaa86de10323e15e9eb7b7a014f8879ac68025b6bbb30ce5"
  end
  version "2024.4.23-1"
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
