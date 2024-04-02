require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4832.0.0-darwin-x64.tar.gz"
    sha256 "d9dc1bfdec4d79f8180b746e6e23651bdf82304259adc3203d57c610c58490ed"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4832.0.0-darwin-arm64.tar.gz"
      sha256 "0f0d69548b19fa77502f814ce486145c86ee759130aeaa019ca2ccd287e13177"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4832.0.0-linux-x64.tar.gz"
    sha256 "7c8a89568a51959de0d3d96d9ec59e1855158bb768fa9823c6eaf80e73cbdd76"
  end
  version "4832.0.0"
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
