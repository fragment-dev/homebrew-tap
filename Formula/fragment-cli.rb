require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.2-darwin-x64.tar.gz"
    sha256 "a2070d7ef3c9a671f4b03ab14c82f04c6724d93e4da681dca386990c834a98cc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.2-darwin-arm64.tar.gz"
      sha256 "ff3f9ef0bb7a7a193bfc7a186bc6bd4ebcb8a75300b5ac1dc573d05c1eee6ad7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.2-linux-x64.tar.gz"
    sha256 "e0baf549b78eaaacdfb15bdf75ec4ddb79d01b2e8641db6f91ae32f74a3676aa"
  end
  version "2024.5.2"
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
