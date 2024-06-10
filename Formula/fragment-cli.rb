require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.10-darwin-x64.tar.gz"
    sha256 "e136d5b5a703c2b2cfdf472139b5d50a882c26a728fcbf35dead06866f811f9a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.10-darwin-arm64.tar.gz"
      sha256 "8d9bc430bfb5ce7ff50512e10e7f2eb6442d6809bed4288462550a5eb9839f9e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.10-linux-x64.tar.gz"
    sha256 "6fe7852089e4da0feb0d8a760eedd30d0c150f0b86ecabe73f663a31894d5a4b"
  end
  version "2024.6.10"
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
