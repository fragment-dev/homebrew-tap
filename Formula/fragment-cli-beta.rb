require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2591.0.0-darwin-x64.tar.gz"
    sha256 "e3528a4b90d6d126ae3538ebe7ae1e12e488ed251dc64fbc9eb07ae23efc59c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2591.0.0-darwin-arm64.tar.gz"
      sha256 "952c6c14e91e791640cea6b41f8296138766e00f78567fb8a06e45308aafdd07"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2591.0.0-linux-x64.tar.gz"
    sha256 "e43e054dc042cdb3a8db336ea00a95f146ea0c95eb63b870672d0212c78e36fa"
  end
  version "2591.0.0"
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
