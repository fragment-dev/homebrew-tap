require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5780.0.0-darwin-x64.tar.gz"
    sha256 "354b62dd9115eda1fcf26499a8ae41a0c289e3b1bc9f500ee343fc3996ad5d7d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5780.0.0-darwin-arm64.tar.gz"
      sha256 "b088efff9a84abdbef05b28d3e69ef6a3db0cc17cea4d6d66df485a2fcd318e7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5780.0.0-linux-x64.tar.gz"
    sha256 "298f3fb3668fded39a85cc13b6cdd44f91326275925e5ad241d150508c892027"
  end
  version "5780.0.0"
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
