require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.30-darwin-x64.tar.gz"
    sha256 "a9641617a0c8c125b6f65c13da778523dc479305df053ae7f958a744c5009313"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.30-darwin-arm64.tar.gz"
      sha256 "ed2d1e7930f6e3dcb10bc05d1661453bff252ac16e8c1a56628772f39b413b94"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.30-linux-x64.tar.gz"
    sha256 "6877566cad168e1fb5b8c12f72d8342aa7e17a20e46d2c2306b30e2b6524e88f"
  end
  version "2024.12.30"
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
