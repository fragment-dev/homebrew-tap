require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.11-darwin-x64.tar.gz"
    sha256 "f17b743ac79dfb803ff4ef3590c445c48d6b0038acce2c30f862d6e8d0f8f61a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.11-darwin-arm64.tar.gz"
      sha256 "f9316894c7c9eef9ef15f76ccc298f3606b14239066a360f39e1bac81a0e2a12"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.11-linux-x64.tar.gz"
    sha256 "306829d2b1ed7d5a819fd63a88e1c079835dd9c7418de6f9bd25ebc3a9eb5b5c"
  end
  version "2023.8.11"
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
