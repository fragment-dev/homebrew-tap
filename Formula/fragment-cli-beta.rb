require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4603.0.0-darwin-x64.tar.gz"
    sha256 "c4ebf3fa9e1f8a7702890a5b088b56c761d6ac9992e855a9d54c71b00b402cc4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4603.0.0-darwin-arm64.tar.gz"
      sha256 "38b8f3d219fe79b0698378b1aec240f081420281b2e5ac49e7475cf40de6eb6c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4603.0.0-linux-x64.tar.gz"
    sha256 "43452b2b4ef5540b538f0dc29304c9475519a1f91523f3d1d4310592acc2aa72"
  end
  version "4603.0.0"
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
