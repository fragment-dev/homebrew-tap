require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4882.0.0-darwin-x64.tar.gz"
    sha256 "6c82658a5b590f3677d66dc118097601c8d0bcc0f197e2c51b13d1cab256015a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4882.0.0-darwin-arm64.tar.gz"
      sha256 "d21c0dc2eedda4a4cd73d1f3f88dd2dc57dc0a4bf67bbf5e830c1786b8c75261"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4882.0.0-linux-x64.tar.gz"
    sha256 "a7134fa9af514addc88c8bccff0e53e7a243255f0c63495ba2d08f88663b0f58"
  end
  version "4882.0.0"
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
