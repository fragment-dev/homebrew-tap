require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4281.0.0-darwin-x64.tar.gz"
    sha256 "2ea66e77a40396af331ce1e8cfbdbc029cab95a50b599167d9a461b8a37b5aa3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4281.0.0-darwin-arm64.tar.gz"
      sha256 "c5b1dc2fd1cf1bf99891f629bebe3439eb6bb6e7d146fa81ec5fbc494105ba76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4281.0.0-linux-x64.tar.gz"
    sha256 "fd1d63de21a21fc092ea2671dcc6677430a806ee7bb271a10c8c497ff00751be"
  end
  version "4281.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
