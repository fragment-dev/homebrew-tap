require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3566.0.0-darwin-x64.tar.gz"
    sha256 "e5e6c3a1766377d8c69e6e3c50934e7a6e4cf0c4dfee677abd5063797c9f42f2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3566.0.0-darwin-arm64.tar.gz"
      sha256 "fe7272747a8afc6e047b2d815a91f1ee0efea85aeaa2d3ae2eb76c4a7a6f297e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3566.0.0-linux-x64.tar.gz"
    sha256 "2490c697ea5d281b8277b58ef8baa64e6fea173f5815432847ab0bb0e9199c60"
  end
  version "3566.0.0"
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
