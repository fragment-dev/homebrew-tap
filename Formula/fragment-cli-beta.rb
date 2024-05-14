require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5042.0.0-darwin-x64.tar.gz"
    sha256 "1306aa4ef4e7f37c803acae02a98c8bd3c35cf3f0e8d1fd3d90bbc03d8033c9c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5042.0.0-darwin-arm64.tar.gz"
      sha256 "cb7195e1d800fbeacd41a535481dbcbbfab1d844c70a163ed6e637eebff98e33"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5042.0.0-linux-x64.tar.gz"
    sha256 "e4d9c4d35766cc8232c5997d92bc0f29922b40f4b4e07da191cf45fa368c57b6"
  end
  version "5042.0.0"
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
