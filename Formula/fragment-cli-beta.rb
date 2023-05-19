require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2703.0.0-darwin-x64.tar.gz"
    sha256 "e732ae91dccb69a789427d4363eae3fb0e20b7d66c66c1425b690ccf48b087d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2703.0.0-darwin-arm64.tar.gz"
      sha256 "6f6b777abb669e9fe354056a21fb354974de7c2617c4c9e1d00d4d5464862a72"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2703.0.0-linux-x64.tar.gz"
    sha256 "373a683725dc91779f76db2d2704fe235fdf4ea28d0c7d68246b5091d7adb183"
  end
  version "2703.0.0"
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
