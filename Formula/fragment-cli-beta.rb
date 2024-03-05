require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4711.0.0-darwin-x64.tar.gz"
    sha256 "f3e286ddad9e4ef72bd2f34c00f8921002ff39cda80526b5bc63b8669eb25d6d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4711.0.0-darwin-arm64.tar.gz"
      sha256 "3fa4affa36ca936053892b2d4697ea21a55e1d65f5de21b60ae5f67b381edb31"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4711.0.0-linux-x64.tar.gz"
    sha256 "a50c7d09a8d1f8d58bc25d5e34ef5bb0645652bd2016e240355182362fbe0076"
  end
  version "4711.0.0"
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
