require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4613.0.0-darwin-x64.tar.gz"
    sha256 "5e03c7316f65802580a3350f131023c9e6ca62f6cecc3ae02c750d5275c49074"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4613.0.0-darwin-arm64.tar.gz"
      sha256 "c141de6eee517e1e5231fc860dca5c7abab813fbd1dd558c0a41901e2ef41d56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4613.0.0-linux-x64.tar.gz"
    sha256 "213e64ab262442c7dac7a7dffbfb3d2d7079b80d50be669346c31c512b76684a"
  end
  version "4613.0.0"
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
