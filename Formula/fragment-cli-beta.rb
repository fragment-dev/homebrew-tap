require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5431.0.0-darwin-x64.tar.gz"
    sha256 "6c000b4fea7a7ce983610f39b501e15ea747cd5b0b116db2aa96638cff20f053"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5431.0.0-darwin-arm64.tar.gz"
      sha256 "d5e3275312a765e924a0d0b58b49f13a90ed33f82ea93ebaf3234bf19bb4ecf8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5431.0.0-linux-x64.tar.gz"
    sha256 "f7fe391304c2e1585036fb224890b1532b208f026243f0d81e789cbb31b7197b"
  end
  version "5431.0.0"
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
