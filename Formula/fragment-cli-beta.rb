require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2754.0.0-darwin-x64.tar.gz"
    sha256 "6bbd47b2fce8670c607c8698ca42a8106f52280f6331ada4715df699512ef374"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2754.0.0-darwin-arm64.tar.gz"
      sha256 "4d07ac78c02fc471bf3b5324ecb1da7b36fddb9c740ecdaf9ae3f892c9914506"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2754.0.0-linux-x64.tar.gz"
    sha256 "40c3bc264ae9f12d59889e6002a81bbc55c24310387262999d0076d36c9d66ac"
  end
  version "2754.0.0"
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
