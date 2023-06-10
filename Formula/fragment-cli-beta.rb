require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2826.0.0-darwin-x64.tar.gz"
    sha256 "900aff9fc7b6b963e6f1cf638963de94c0c0ef5d9efda249306ab1fb750d01f7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2826.0.0-darwin-arm64.tar.gz"
      sha256 "8d2a3aed2f04449b6726d7600ecb8240fd980a9b263f1dc08f53a25c0b00720c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2826.0.0-linux-x64.tar.gz"
    sha256 "9584867c34f9589d56eac258548195072b578d78247f6e148b130142d742f565"
  end
  version "2826.0.0"
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
