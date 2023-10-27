require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3926.0.0-darwin-x64.tar.gz"
    sha256 "5ecebfb852f2a60fc41f6140141ba1c3656f051df5f3fbde91dce2a576e93852"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3926.0.0-darwin-arm64.tar.gz"
      sha256 "1d8e0d2c7ecfc9d81bea5fc5b19a462e8aae75627a4862a01ab4a0ea7e2a0efd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3926.0.0-linux-x64.tar.gz"
    sha256 "0b508bf5cab7d06e94c2f371c230620b374c03f5644c4cc3785050510b95531d"
  end
  version "3926.0.0"
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
