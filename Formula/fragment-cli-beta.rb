require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5683.0.0-darwin-x64.tar.gz"
    sha256 "6d8bdc3bca1521216355c1125dc43d33529721efc413fb1b6029ea250003e08a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5683.0.0-darwin-arm64.tar.gz"
      sha256 "a29eb3900376f1801c9f129d3d4b820e186d0bd7e83a8e82cc4de27aed662b88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5683.0.0-linux-x64.tar.gz"
    sha256 "8903858f1fe92407f7c827015d31a481a655ce1921e0c97f8efaa43ec4423527"
  end
  version "5683.0.0"
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
