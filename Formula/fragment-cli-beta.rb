require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4793.0.0-darwin-x64.tar.gz"
    sha256 "62622234ac628022f8d98d778c31a0a56b31b2c20d730f2a30e09ffab715ca9b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4793.0.0-darwin-arm64.tar.gz"
      sha256 "8998dd40ad0c2f56d3e7b6fa9cd0e541c81c817e6fa65e210ab565118ae59872"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4793.0.0-linux-x64.tar.gz"
    sha256 "dc02000425b6d33ca7aedc0b9791b35c3636d4051a3dd2e943df9dfdf7dfc28a"
  end
  version "4793.0.0"
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
