require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5717.0.0-darwin-x64.tar.gz"
    sha256 "eeb91ab7577346df9114aa85318b3fead0d965725a7ccde68d33e133fbb25a3a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5717.0.0-darwin-arm64.tar.gz"
      sha256 "d5e97960161d67cbe3998b014a3b764eb089dbd14b44c983bb9f0e88c1ca8fb0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5717.0.0-linux-x64.tar.gz"
    sha256 "ccff57b0a7fdef32c2df537d398c6887162394ee6372ea92c93a7cd44335cc81"
  end
  version "5717.0.0"
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
