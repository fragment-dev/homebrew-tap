require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2761.0.0-darwin-x64.tar.gz"
    sha256 "050d88a58a9ee92fa926baa049ce305d5ab74d6e633d6e37dbdac135da7d43c8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2761.0.0-darwin-arm64.tar.gz"
      sha256 "257a7ad0a24a88149e172b60079cf00434222ed0ac42eb667ea3b048132eb4e5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2761.0.0-linux-x64.tar.gz"
    sha256 "aa5e131eb427345866f1eef23cf099eb0c8eec862cdb57055e96b872c7527bbf"
  end
  version "2761.0.0"
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
