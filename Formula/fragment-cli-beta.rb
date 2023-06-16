require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2870.0.0-darwin-x64.tar.gz"
    sha256 "58c8004baf360a51b2377b47e52af4c4077c3297fa8bc2c9bbdb56a56e11a285"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2870.0.0-darwin-arm64.tar.gz"
      sha256 "cccda79d051c68abe5120d4a7f669baf3a15418baee71d70816f985288c8cfb4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2870.0.0-linux-x64.tar.gz"
    sha256 "a9226577de2b3fa4c5a4390c53c38722f75f7ccb66f79fa1396519d4c821e927"
  end
  version "2870.0.0"
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
