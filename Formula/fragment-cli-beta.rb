require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5364.0.0-darwin-x64.tar.gz"
    sha256 "a002e551792c357b0ba416808eb0f799fd52042e8b475e3b2132cab5ad703656"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5364.0.0-darwin-arm64.tar.gz"
      sha256 "73a0eabb34d0c8bf3f3e47c6d65709d26a1fa77769cb9700776b800ef99269c6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5364.0.0-linux-x64.tar.gz"
    sha256 "f52c8cb444044bf3fb4165a80ff3bfa8d696b37bfcfdfeffcf9490d81e6f95d5"
  end
  version "5364.0.0"
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
