require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-darwin-x64.tar.gz"
    sha256 "a573033bd106a00688b026af7e19af6ad9bca9775530b6c0388e729628582f68"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-darwin-arm64.tar.gz"
      sha256 "7deed01532745d5545415a64d5d264a82f85b6df91a5c96a6b96692d1adcd5e3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-linux-x64.tar.gz"
    sha256 "a6f5cc235cdf50ef37f81eabe9194882a33603dec4dddf11eae423db476457af"
  end
  version "2024.12.24-1"
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
