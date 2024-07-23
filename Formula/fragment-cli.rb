require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.22-1-darwin-x64.tar.gz"
    sha256 "48ad14b8f28ecd0d949cae6080acb802975c8d8718eb1c1aec1aa7e6e540313a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.22-1-darwin-arm64.tar.gz"
      sha256 "b17db29e94c776999e1a1c45a93cfe551083f6d52d88ac2c8d0bae9c1493a686"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.22-1-linux-x64.tar.gz"
    sha256 "07823bc8f79060820a0665384567c2d8bea1ca260caebc5d9780b176ed333622"
  end
  version "2024.7.22-1"
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
