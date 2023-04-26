require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.26-darwin-x64.tar.gz"
    sha256 "7480ea3016771be9aac620e035cdfc6da1bd4b13c730e4cf2d63f9fd75ebb5d0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.26-darwin-arm64.tar.gz"
      sha256 "26f543118c5b2284a13f8b11f48f926b56cd787442df42f3fc2f7094f3721502"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.26-linux-x64.tar.gz"
    sha256 "3bf16d6f9adca4e135d32438263e2f93609d0dddefba34b0e11a581ede502753"
  end
  version "2023.4.26"
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
