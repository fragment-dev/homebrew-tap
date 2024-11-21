require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5810.0.0-darwin-x64.tar.gz"
    sha256 "73e2022674a93b70e72c08754eee59f207afce50bd04c259a7f918713156f3f5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5810.0.0-darwin-arm64.tar.gz"
      sha256 "988c90f3296915333b35b7966ffc9cc59329c6d478053e7118d0d00a8c08d605"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5810.0.0-linux-x64.tar.gz"
    sha256 "414673531dcb43b8a97fb47beba3cef3bbff4713b75492b983f6812d068b751d"
  end
  version "5810.0.0"
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
