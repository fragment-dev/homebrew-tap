require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.30-2-darwin-x64.tar.gz"
    sha256 "68e5f49f825db42089e156147a5173b563b79180d9f314c5260d13dd354b2f56"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.30-2-darwin-arm64.tar.gz"
      sha256 "b7c386ec69846ff47f18048bc1fecd4ced2f2b2031c86b6d39bb7392e37ef71b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.30-2-linux-x64.tar.gz"
    sha256 "1a2f9ba8a6e485ec363693ffd328e30cf8fa5aea48f5bf517d6136457854d8d6"
  end
  version "2024.5.30-2"
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
