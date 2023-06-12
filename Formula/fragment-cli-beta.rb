require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2837.0.0-darwin-x64.tar.gz"
    sha256 "37b44c93a0cf76131e312db5c07cac0f6887ce1e14433458e5775deaf4cbedd1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2837.0.0-darwin-arm64.tar.gz"
      sha256 "1a41951b1886661233100b39d6eb6166212cc9d33a3696a2d60d68f284b794c2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2837.0.0-linux-x64.tar.gz"
    sha256 "8d8b70f3c32dbf29224cbee8eb6b9e903694b48a821b772e75071fe68b0a6e2d"
  end
  version "2837.0.0"
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
