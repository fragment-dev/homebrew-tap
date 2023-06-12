require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.12-1-darwin-x64.tar.gz"
    sha256 "604892c6aeff4938a156bcb18df052748e7e51b4d845e1a66ae2a7508eaa5a0a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.12-1-darwin-arm64.tar.gz"
      sha256 "4c103707efe8140ef9281ca4f968a1ea8dc3b45f59a147e211c7010e1a7ea2d6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.12-1-linux-x64.tar.gz"
    sha256 "8b197542e8188409fbc00c9b487dcce0fc56ed198676f96307f1d2364087c671"
  end
  version "2023.6.12-1"
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
