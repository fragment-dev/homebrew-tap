require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5671.0.0-darwin-x64.tar.gz"
    sha256 "66ec7385fbc62383b34e101dec76ebd7789abbec202f8913ccda33f2580fd28f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5671.0.0-darwin-arm64.tar.gz"
      sha256 "7b8248e6cce0b60a7bb1681f91dfcd10112a865803ffe3dd738c31b5b7d33a66"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5671.0.0-linux-x64.tar.gz"
    sha256 "09c1875a983c398f506bb901b8529b5f517571e833216ecca1a8e1755f09fb29"
  end
  version "5671.0.0"
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
