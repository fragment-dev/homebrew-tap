require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2237.0.0-darwin-x64.tar.gz"
    sha256 "4a583d202a832c92a3ceb4c312f1c28d6047d457361772e1ff73b94df3a09392"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2237.0.0-darwin-arm64.tar.gz"
      sha256 "dc7137e81d530ab89a8048cfe6268ffd4cbf66570df041bdc2e703a768f45d5a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2237.0.0-linux-x64.tar.gz"
    sha256 "aacd947da59b57e5fa5c1168fc486895ce8edf668de5bf68d2dc6209ae89d823"
  end
  version "2237.0.0"
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
