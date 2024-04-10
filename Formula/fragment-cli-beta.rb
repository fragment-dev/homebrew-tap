require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4869.0.0-darwin-x64.tar.gz"
    sha256 "e0fbce179229f56d141f9d1661737a9882713525f498edda821db645936c9219"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4869.0.0-darwin-arm64.tar.gz"
      sha256 "06831185c0c6ddacfde81076a4269f226bb3f0e4b35cdbcafc5b55f7814a1432"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4869.0.0-linux-x64.tar.gz"
    sha256 "6ef7f97724a795eb40ee98de3928e6f55bb1d15230ce79537ce8eded42bf7b3c"
  end
  version "4869.0.0"
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
