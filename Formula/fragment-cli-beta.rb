require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4005.0.0-darwin-x64.tar.gz"
    sha256 "86b31f7504e905c86e175f0827f34572b17b66ec02ba2df0a85f2d5962ef7bb1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4005.0.0-darwin-arm64.tar.gz"
      sha256 "1a992a045d9bcaee7098a0561aed87b97fc2f4f7cef9d38543322ba687b2854c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4005.0.0-linux-x64.tar.gz"
    sha256 "837f71ed407fdad4484d31d8f48e32faedd26fb69ba123731b897acb470d32eb"
  end
  version "4005.0.0"
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
