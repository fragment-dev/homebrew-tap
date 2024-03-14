require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4765.0.0-darwin-x64.tar.gz"
    sha256 "c124d346853d62ff7b7bbc1737e9008dda78eb05b859fe6450cf88c16ab01934"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4765.0.0-darwin-arm64.tar.gz"
      sha256 "0aa0e899dc07fc8cd9c350358216639b022d4d90baaeaa999779a24a5baf057a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4765.0.0-linux-x64.tar.gz"
    sha256 "f3e2e6b4063ad6fea0a8ee5cb7be893047d7b20d364cd22f1689b5c396310a9c"
  end
  version "4765.0.0"
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
