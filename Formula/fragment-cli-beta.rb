require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4934.0.0-darwin-x64.tar.gz"
    sha256 "f1095891a98a7a28170955bea8161d5132a4f0e3fa1dda50f94c22caae6b90cf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4934.0.0-darwin-arm64.tar.gz"
      sha256 "744fa497c1d1bab600f765caf0cbbb286f7f6c67fb1e7c61478015d5b2140230"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4934.0.0-linux-x64.tar.gz"
    sha256 "ae178613194c46709df87178d12d3c20d64683f04af65f7687059e07b2dce103"
  end
  version "4934.0.0"
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
