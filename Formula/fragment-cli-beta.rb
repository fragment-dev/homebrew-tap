require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3288.0.0-darwin-x64.tar.gz"
    sha256 "a944dc8c449e243671a97d730b1da8b7cf6180018805a71bf81220503792e9b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3288.0.0-darwin-arm64.tar.gz"
      sha256 "a42530d05a8630fb44f3fe36e2ac8755a33ea01fc252dabfceb7a33417d50fb5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3288.0.0-linux-x64.tar.gz"
    sha256 "d374203096a6bf02e9b2d697acd07c9ebc77f3ffedb8aa48e515eb9fcf71ceb9"
  end
  version "3288.0.0"
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
