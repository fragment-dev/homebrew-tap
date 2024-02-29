require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4668.0.0-darwin-x64.tar.gz"
    sha256 "0a82f21c2b39b173e98b0c82df6e1d168a38d0cdc9f19df2ae33d4e38d3bd7b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4668.0.0-darwin-arm64.tar.gz"
      sha256 "5739dd90b97bed73add7446a6b90034b472199f5e1f95c1e9d6b3ea3c7abda3c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4668.0.0-linux-x64.tar.gz"
    sha256 "d8052a534626aaaea25e3ebebb2d3bad0fc0859509168872258599887e40d2c4"
  end
  version "4668.0.0"
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
