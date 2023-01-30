require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1866.0.0-darwin-x64.tar.gz"
    sha256 "5f8410c3039a99e758c4fb1dac93e0dd8ee99e139f62678e0d30c171f68d208e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1866.0.0-darwin-arm64.tar.gz"
      sha256 "ebc1a0ee4a6af0c89f915a988f3163b82e40d28969016033bacaf6b3b6c1e5ab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1866.0.0-linux-x64.tar.gz"
    sha256 "427d2521532bb2ba9de7b1776992635c5bfd774b355f4f33ae2e8597dd6fa02c"
  end
  version "1866.0.0"
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
