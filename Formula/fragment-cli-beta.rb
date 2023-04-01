require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2333.0.0-darwin-x64.tar.gz"
    sha256 "a7ba7589a26ecddf00a2b6034e66d49e1508df6073ef198dbf9c3c9514c54c29"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2333.0.0-darwin-arm64.tar.gz"
      sha256 "f17b9c18f3e63d7e6127a64f86d476875d1dfa4a24bf35e2792ddb2eeea7eba6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2333.0.0-linux-x64.tar.gz"
    sha256 "c761b88b6e9eea4882eb26ce07cdc3b7eb72ce727dcb7c6544985dc0d7c387ed"
  end
  version "2333.0.0"
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
