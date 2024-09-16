require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5591.0.0-darwin-x64.tar.gz"
    sha256 "41cda729dbf428900ded4ef22879084bd27b50be41a0484fb8b4812dcb234e7f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5591.0.0-darwin-arm64.tar.gz"
      sha256 "c9fb41f530ba0e0b014646e5ad694556304f50b7917964b8441e2c36c5d17193"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5591.0.0-linux-x64.tar.gz"
    sha256 "49e25b1e7051fee45f76c256f224425c44cfb55eb4d5106605de596de23d0402"
  end
  version "5591.0.0"
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
