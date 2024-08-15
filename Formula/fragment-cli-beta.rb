require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5510.0.0-darwin-x64.tar.gz"
    sha256 "71ddc931deea63e88a8247ec6c28702c94aed8ba44f3931bfd98744afa9541a9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5510.0.0-darwin-arm64.tar.gz"
      sha256 "2500a1697519545d466828b870cafcc47fd082ef08e7f4375a40e2ea814b029f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5510.0.0-linux-x64.tar.gz"
    sha256 "7b532960a66a7ac46f86a03b6d0018ea0b0897bdafc6c9358f57ce52e49eb907"
  end
  version "5510.0.0"
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
