require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5306.0.0-darwin-x64.tar.gz"
    sha256 "967b0168da1f332cc0ff23e8276d87b592068bfe49ad6481c50a533e2ec19918"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5306.0.0-darwin-arm64.tar.gz"
      sha256 "05f6d04fface1c733c785db4e5c00b1fc08f5cfa09e168ff08a0d07a9b4f21e3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5306.0.0-linux-x64.tar.gz"
    sha256 "fa641e032aa32589298387f9b741bfb66b7440a441d66017896d361b7b0b7780"
  end
  version "5306.0.0"
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
