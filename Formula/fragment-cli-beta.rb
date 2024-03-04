require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4696.0.0-darwin-x64.tar.gz"
    sha256 "203112fa9929374a6545272e6d74282f575d47c4901d39261de089eb0a4cb46f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4696.0.0-darwin-arm64.tar.gz"
      sha256 "14b923dceab80c015dabbcbc954823c3cf20e2532f0c494befdc0496cfebcbab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4696.0.0-linux-x64.tar.gz"
    sha256 "0da8724244aeda8aa4c07ebe98a8ac8441a8f56cf08d54f486d66095894ffed5"
  end
  version "4696.0.0"
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
