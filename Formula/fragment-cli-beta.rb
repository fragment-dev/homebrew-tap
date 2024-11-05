require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5731.0.0-darwin-x64.tar.gz"
    sha256 "5bd23bbdd63fedf7082f71fb3a906fe9323d95a6c367c3900a0f14c20677660b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5731.0.0-darwin-arm64.tar.gz"
      sha256 "5aeded3b3a372c8cb7f17fb34fb7ba8d8ff3f1e30e6292872100179b1b5e99a9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5731.0.0-linux-x64.tar.gz"
    sha256 "7d2ac22955c2541fd4c62c6ae7361c2a0111d6e518ba3848047e74cacb801bc4"
  end
  version "5731.0.0"
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
