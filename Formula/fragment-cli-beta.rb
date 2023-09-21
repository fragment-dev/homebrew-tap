require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3637.0.0-darwin-x64.tar.gz"
    sha256 "5504f641cdd56c9011736c3923716666eecc8c99fd747300a92acee9d4a9c9da"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3637.0.0-darwin-arm64.tar.gz"
      sha256 "3f260acc7c47cf8be22e10fbdc5444ca2106fa3a6cc0bcb3123f7facdf4b605e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3637.0.0-linux-x64.tar.gz"
    sha256 "2aa814334433a4d1430f77fd150f85877f7cbf7aaaccefb345ba096475c4fe10"
  end
  version "3637.0.0"
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
