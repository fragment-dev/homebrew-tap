require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2845.0.0-darwin-x64.tar.gz"
    sha256 "e78355519d7792ae3ca21bef2cef670e53dc332086c45ff212a6528f3442e574"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2845.0.0-darwin-arm64.tar.gz"
      sha256 "1f832492f1b4e4a414fd685985baf97b683bbc51247e7c0aa38989527cf32a54"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2845.0.0-linux-x64.tar.gz"
    sha256 "55fcaa8119ead6aea6f1ae4f7d44c0136cc010f1f70f673abd61481f7463ccb7"
  end
  version "2845.0.0"
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
