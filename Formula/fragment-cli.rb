require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.16-1-darwin-x64.tar.gz"
    sha256 "ad4ec06423ce0cff4f88b2b2d678195d96ea4376740cacfc2cb348efe358ad2e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.16-1-darwin-arm64.tar.gz"
      sha256 "5333993e592063d51572f085d1c51c63dda2a27d0a36246df5ad025b353b379e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.16-1-linux-x64.tar.gz"
    sha256 "373aa9980586408270448ed031f54f589acaca3eb9dc557db1b2c27e7e42af69"
  end
  version "2025.1.16-1"
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
