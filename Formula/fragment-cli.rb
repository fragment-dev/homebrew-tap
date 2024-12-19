require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-1-darwin-x64.tar.gz"
    sha256 "7e99de6037487c61d3664bd565f35e152941cdfac00f0460c36aa56476146477"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-1-darwin-arm64.tar.gz"
      sha256 "6b0e4f78d4a9e1ebbcacf02e01e8bd2ca06a8f870a81e4f0837d1ed293d3e459"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-1-linux-x64.tar.gz"
    sha256 "c28165150c99d9dfb2ca5c6f0b0261f096e56c79240fb797dd21df08fb9842a5"
  end
  version "2024.12.19-1"
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
