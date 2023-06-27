require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2940.0.0-darwin-x64.tar.gz"
    sha256 "bcafa822db6148d03fd3d22ee641ad01f32096393c2fe29951ce2ab37b6e63bc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2940.0.0-darwin-arm64.tar.gz"
      sha256 "df3934e1f003d46ac3c9c5494375674ed60dcb9cf0af912b762c896c9bce169b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2940.0.0-linux-x64.tar.gz"
    sha256 "371e90da2c68c39316141d211368167aed291e59ddc41fa1274937a2f7c7101c"
  end
  version "2940.0.0"
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
