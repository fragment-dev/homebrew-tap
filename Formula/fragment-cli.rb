require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.4-darwin-x64.tar.gz"
    sha256 "67badf5a94c5c988422a79ecc8798d5adc568e8eb2d875e90fb8cbf5e95ab4b2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.4-darwin-arm64.tar.gz"
      sha256 "bc09c39b83fffb4b92efba5ab4be575c43e94ea9bd3e5975ec540f210037175f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.4-linux-x64.tar.gz"
    sha256 "c09e5342a228ba1eaf1dd2f86fc340f0af8f31ceefe5459826e164cd1f44b978"
  end
  version "2024.7.4"
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
