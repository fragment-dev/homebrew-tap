require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.1-darwin-x64.tar.gz"
    sha256 "79e22a2336cd2dd2b5fc6683f0dca865d317889e1e0227db35956cdaf4e8c5b2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.1-darwin-arm64.tar.gz"
      sha256 "88d8f8ad4e0d0ed13d991981a59186cab5735c6fd9cfa33448929d664848f8b5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.1-linux-x64.tar.gz"
    sha256 "1cdc4f02076f86c737055aa4a46935bbb5269bf4df3ed07648610ff47530d607"
  end
  version "2024.1.1"
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
