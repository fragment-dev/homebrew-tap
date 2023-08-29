require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-1-darwin-x64.tar.gz"
    sha256 "7edabe283362b04393ef9f1c40b62cdea1d97e546b4a41d4b3c2b285278dbcfd"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-1-darwin-arm64.tar.gz"
      sha256 "ad2b459b2913354c9cb88d906acb09a7ca0b54db1a13c1e62cd698d93485ea20"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-1-linux-x64.tar.gz"
    sha256 "e63c16590d2b4440796bbd186c1ebd422f4c34e56420c4d56b60992a033fa653"
  end
  version "2023.8.29-1"
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
