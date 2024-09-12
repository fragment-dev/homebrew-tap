require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5584.0.0-darwin-x64.tar.gz"
    sha256 "355e99bef8ef5286402cd1b4a035aa308e8f7d9c5a26b3db4f646a3ee0a17bdf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5584.0.0-darwin-arm64.tar.gz"
      sha256 "295facad9057e8c9950ece42f155bc4eabbf3585e6785cc5adc5636ecfc3f60a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5584.0.0-linux-x64.tar.gz"
    sha256 "c08bfbbd80e5fd8a0163a2dc25a921639141b40db45e062821c7045d2cac19b9"
  end
  version "5584.0.0"
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
