require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6939.0.0-darwin-x64.tar.gz"
    sha256 "a7b83735cf6fb5771cc12bd79ed7198286a462ed437b408021e1973eaee79f8b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6939.0.0-darwin-arm64.tar.gz"
      sha256 "3b1f4aa05c39b3845837ed747147ea84de28658a87b870822842f3363e3a2195"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6939.0.0-linux-x64.tar.gz"
    sha256 "087de3f16181516c6c6b5cda09007406b4741105bae363acd7f6b13cf33bd470"
  end
  version "6939.0.0"
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
