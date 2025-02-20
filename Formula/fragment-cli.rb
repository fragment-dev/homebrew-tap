require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.2.20-1-darwin-x64.tar.gz"
    sha256 "fdbf7cce5e868dbcac54ccdc6e5f79fdbcab82b70579ddf1c2518431d2cd7cee"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.2.20-1-darwin-arm64.tar.gz"
      sha256 "893658782139f4d4399f5a19294dfce5277d781e65ed755b1dae910f7b12ca27"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.2.20-1-linux-x64.tar.gz"
    sha256 "514de4680d08250e97494d84f1ad5532ad0afe860de4d75fe505813f1b0964d1"
  end
  version "2025.2.20-1"
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
