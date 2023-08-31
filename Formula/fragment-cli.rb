require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.31-darwin-x64.tar.gz"
    sha256 "f61909d30ea1d8e4b82530cd5ccd12b49f73a08c9a49c983da43af125d7a25d9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.31-darwin-arm64.tar.gz"
      sha256 "bb04be899d424b04f1fb776024f3c34ea4fb937ba0779f28c09ff347f7cea25c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.31-linux-x64.tar.gz"
    sha256 "99862ad9a96417fc2a310d191cfea02c1664bee943151b84b83dd82fe814f55b"
  end
  version "2023.8.31"
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
