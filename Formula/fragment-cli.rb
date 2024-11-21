require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.21-2-darwin-x64.tar.gz"
    sha256 "e8e0b07c15f1ffd4f3a26052a8e8f57922c2ef364377e03960014e020559182a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.21-2-darwin-arm64.tar.gz"
      sha256 "0cb9a3e4a4d5a061710b12b81e5de9854b987f08c2dd8faa47a40db4fbc7df02"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.21-2-linux-x64.tar.gz"
    sha256 "77bdee6e752bc4ca0995cebf8e2391e18b56ed8300a867a7d2b0ee6d7fb43860"
  end
  version "2024.11.21-2"
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
