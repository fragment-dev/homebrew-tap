require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2589.0.0-darwin-x64.tar.gz"
    sha256 "ec299d3a77157c46fcef71f63a0340ae5620aa27d25b70c4b7829ecdb0b7931c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2589.0.0-darwin-arm64.tar.gz"
      sha256 "19455dee1026e400addd328f54e76f48f68b9bcd05755a7da1d9f933b62a9dbb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2589.0.0-linux-x64.tar.gz"
    sha256 "d65cc259b054c76f07a535182bc6499895b58265a18f4379b7c4457cb34fded0"
  end
  version "2589.0.0"
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
