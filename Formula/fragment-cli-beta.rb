require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3654.0.0-darwin-x64.tar.gz"
    sha256 "92bc58ae28fecb68b851e17c4bbe045e08eefb46edd6881d8dc7b49797a20379"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3654.0.0-darwin-arm64.tar.gz"
      sha256 "87bef4c32047b0da0b2a50f0a679f2eb1eb6ea63f6c9dbcd012106007275ce2c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3654.0.0-linux-x64.tar.gz"
    sha256 "62c271e663619cba7773ab3a205898b7b6148cb27588313ca6e80b3802d56122"
  end
  version "3654.0.0"
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
