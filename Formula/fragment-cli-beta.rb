require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3662.0.0-darwin-x64.tar.gz"
    sha256 "1bf4633b4b5824d58a1f118de6857a3213282834c16d31ae70ab432ac72490b8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3662.0.0-darwin-arm64.tar.gz"
      sha256 "b6d6b2c4e6e058ace512612a18dbd088e0e9a42a03e8f56803b7430ecf2a4a47"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3662.0.0-linux-x64.tar.gz"
    sha256 "716db7a791bcf3197ac0bffffb35e1eeafd5628f01ee44838dd867efe964283c"
  end
  version "3662.0.0"
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
