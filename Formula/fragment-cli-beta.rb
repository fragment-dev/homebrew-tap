require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3627.0.0-darwin-x64.tar.gz"
    sha256 "f191f9f3d31e1c2ad827f3670c123ef65da6af1bacfe5afc6c94c5affbde0957"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3627.0.0-darwin-arm64.tar.gz"
      sha256 "b16810204420e7f3273bc92c6ab375699f8b712ce56d092e77c903d1756da1ea"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3627.0.0-linux-x64.tar.gz"
    sha256 "64746cb8cb8135c29015d386ef38cddfc5f70f186c795c179e47a1d3fca4fac4"
  end
  version "3627.0.0"
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
