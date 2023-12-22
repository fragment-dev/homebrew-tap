require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4201.0.0-darwin-x64.tar.gz"
    sha256 "2fb29fe0dca82870e0be18fde6039669a91196378725cec30efe33e661220359"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4201.0.0-darwin-arm64.tar.gz"
      sha256 "58314eceb943f83575d7bca10a988f400888c192074df15981a263bac224c34c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4201.0.0-linux-x64.tar.gz"
    sha256 "69342098c436ea37f7bcf303450595de85461f166b67b7dbf73a988e574edb3e"
  end
  version "4201.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
