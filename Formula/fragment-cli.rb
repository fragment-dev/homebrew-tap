require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.21-2-darwin-x64.tar.gz"
    sha256 "90f5aa4d2c16329b00d9c2edaa9dd94101755e891233e67dd5d18b3ff19d0670"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.21-2-darwin-arm64.tar.gz"
      sha256 "55dcb374e44154752f9896030450788482792068118e09cc03db1ddf5895d4a0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.21-2-linux-x64.tar.gz"
    sha256 "5012ccb915cff06acc696f882b3b373d84fb4cb268f00476d07b70275752ec8a"
  end
  version "2024.3.21-2"
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
