require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3546.0.0-darwin-x64.tar.gz"
    sha256 "1baf63e5bd25485699516bc3a028dc41649112b53e4e36c9e8681dba9c8cdd11"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3546.0.0-darwin-arm64.tar.gz"
      sha256 "f612bdfbb3fdd1ae9a2e4feec8f0fb47e6c7310a8fbac8f62a9250097374c99d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3546.0.0-linux-x64.tar.gz"
    sha256 "23ca6d3c25decc27b6614708ba6f99027490fe29ae1892c712f1526a2db23bbc"
  end
  version "3546.0.0"
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
