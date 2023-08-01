require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3205.0.0-darwin-x64.tar.gz"
    sha256 "9e4513146a521a6626fcfd40b0e86d082631b613caefbb7a6d84218a5bb00b26"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3205.0.0-darwin-arm64.tar.gz"
      sha256 "2e310b5e13043534ed3561c1d28d2ecc4911158277dfce53e9518856de421c93"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3205.0.0-linux-x64.tar.gz"
    sha256 "7fe18b1f6a2e6c6c145a9827487b4efd44eeb093b8dc700ddefe92c4cd047c79"
  end
  version "3205.0.0"
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
