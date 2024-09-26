require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5624.0.0-darwin-x64.tar.gz"
    sha256 "63d60035a82e0646326edda9a0cb2e0a6ce2c9b8c935a536c5303457a7bf8417"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5624.0.0-darwin-arm64.tar.gz"
      sha256 "84c0837acbc37ad118665e5777737d1c2dd8ce3d05dbd92d9d12f2298b5a5eb1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5624.0.0-linux-x64.tar.gz"
    sha256 "946835225ce1e30bf486c7da91122aedca7e60f964b702c481dec4e7814acf04"
  end
  version "5624.0.0"
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
