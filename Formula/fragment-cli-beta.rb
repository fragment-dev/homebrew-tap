require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5405.0.0-darwin-x64.tar.gz"
    sha256 "78c395c92cbe9600849002c7876065d0a5c3030c8dd1adc2aa6653cc0d051ca5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5405.0.0-darwin-arm64.tar.gz"
      sha256 "0336b1e813729388578f48e42b346440a2f438f9e53f2f844cfa7ae1315b1c7a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5405.0.0-linux-x64.tar.gz"
    sha256 "180bdea2fddfaa4e0c3c1d7cb03d69beedc1eb781289336eb12f94ffb13c64a5"
  end
  version "5405.0.0"
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
