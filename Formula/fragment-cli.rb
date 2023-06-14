require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.14-1-darwin-x64.tar.gz"
    sha256 "60f37cd3179c5e88b8ec06c376fd1cacaed2ef348aa062df7d477f6830e5b07c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.14-1-darwin-arm64.tar.gz"
      sha256 "e638a95104b58690bf6e27e1cb921437a29cf25a19dd4793f476c67bbeda103e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.14-1-linux-x64.tar.gz"
    sha256 "1a28ede3ab26ef2801d53e0af66f3b771c13a40b29430dc145ae5adb1fa83e63"
  end
  version "2023.6.14-1"
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
