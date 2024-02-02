require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.1-1-darwin-x64.tar.gz"
    sha256 "39ea461ea0763a034fe1ed296409e4ec9708a3632b0bc465c0c21eef429f5183"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.1-1-darwin-arm64.tar.gz"
      sha256 "8f5baf509ad41d049cb85aaef86410334dc78083890b135bda976e7f5b3ca5cf"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.1-1-linux-x64.tar.gz"
    sha256 "46384d474eda2c2731e18570a2c29c9ef33d7eee30a877afa52bb99f11a9d4a0"
  end
  version "2024.2.1-1"
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
