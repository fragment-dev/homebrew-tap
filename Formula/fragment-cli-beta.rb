require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2757.0.0-darwin-x64.tar.gz"
    sha256 "2a096d4b044a122726e3ec80777a33778623f0f1cf08b65a957447595178531f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2757.0.0-darwin-arm64.tar.gz"
      sha256 "9f179625581748e6bd585e9f394cbd97b948d692a978195714fe23adfd23a6f2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2757.0.0-linux-x64.tar.gz"
    sha256 "a4b0017e860a97ced87aa8f7991c1a880e443d40341642ddc950280499fe2ee2"
  end
  version "2757.0.0"
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
