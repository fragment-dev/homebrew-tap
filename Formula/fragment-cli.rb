require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.16-darwin-x64.tar.gz"
    sha256 "88f6adc7291497d77cdc0d9bc5c7668322fae7d8af4a561183f1cce642cad9c2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.16-darwin-arm64.tar.gz"
      sha256 "7d0f1890d9dbbf0cd3aaff63af6abcc088d27a6a30041b545825563d88d09092"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.16-linux-x64.tar.gz"
    sha256 "cbeb0c779dc9206122fddb71a11fc4423cee6e2115a6ea7ff8cdadfc1fa0e7d7"
  end
  version "2024.1.16"
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
