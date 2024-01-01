require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4242.0.0-darwin-x64.tar.gz"
    sha256 "05148582c76095d155b273b8266edb3e486417a5225031fa18f926ba4f51eb01"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4242.0.0-darwin-arm64.tar.gz"
      sha256 "9cb78838d243426df52b5f1be9ce06cddb0838850069d7414844d20171931ae2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4242.0.0-linux-x64.tar.gz"
    sha256 "22c75b047ba41c2fcf70f86d28a125618702a575e6e8f27fbaf831e9cffd12f7"
  end
  version "4242.0.0"
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
