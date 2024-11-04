require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5725.0.0-darwin-x64.tar.gz"
    sha256 "1249452a4bd14ece8b8893e6a3980f7a6c399b17aeb2b8a5ad538040c31925c8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5725.0.0-darwin-arm64.tar.gz"
      sha256 "0e45efbb56c9efc9fba7261cf0b4d3eea0e10ac8e65cadf9a82c27eeb91536d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5725.0.0-linux-x64.tar.gz"
    sha256 "ca7dc82754b2100d85033b9829724cef976ce97a4c6fdee61529e81482b46a26"
  end
  version "5725.0.0"
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
