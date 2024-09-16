require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.16-darwin-x64.tar.gz"
    sha256 "256b8f09ea0aa779068738076f074f55e9e93551cc274485c67bf2848631449d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.16-darwin-arm64.tar.gz"
      sha256 "52885bd97d04ec7f639abf7a54d4e023a7736c1de7d7d25e43a76abda180daeb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.16-linux-x64.tar.gz"
    sha256 "29f7f8218fd6e56f135a2c6c87dd109c2da28cdfdefd56c4f81ad4accbfda14c"
  end
  version "2024.9.16"
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
