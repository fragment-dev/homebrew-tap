require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5921.0.0-darwin-x64.tar.gz"
    sha256 "8ec62506a5283fdd374fc15904b0b8516ebf7ab00996bc33047d5954ea401eae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5921.0.0-darwin-arm64.tar.gz"
      sha256 "e37dc6593280d10a8422d9b51f8fb99ff60dc576c737be1354a9f77f181da9e3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5921.0.0-linux-x64.tar.gz"
    sha256 "2dffdbef998e07c7514f8d065a3ed7a4bd4bd2f708576e5b5f7a5c77474cc56c"
  end
  version "5921.0.0"
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
