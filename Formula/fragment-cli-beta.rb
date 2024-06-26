require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-x64.tar.gz"
    sha256 "054f6c07baed6da29e3dade3e905ab6dcad6cc09b057279eb46deadebdac298e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-arm64.tar.gz"
      sha256 "c58b7bc14cba7f8a25de2ff00f70f71b40b29c6dc3e26f70cd77ecda8bee141a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-linux-x64.tar.gz"
    sha256 "0da385bb837b6a130a5120b9ece1adff8e89e0a6dfc2ef472e63740248e63e68"
  end
  version "1.0.0"
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
