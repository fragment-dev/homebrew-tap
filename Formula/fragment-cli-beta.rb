require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4736.0.0-darwin-x64.tar.gz"
    sha256 "14379cda15f2b550d66d264729c969b6fbfc7dfe9285e63d7016a66bae6b5556"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4736.0.0-darwin-arm64.tar.gz"
      sha256 "be32b8a54aa55fa1424e62882e59f1f59383c024501e6306790e8c8d6bb65dcb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4736.0.0-linux-x64.tar.gz"
    sha256 "0f2b7eae1eb69c750ac6902cd7e14dcf87b25bc17f23fcf21733ff9c23e4a074"
  end
  version "4736.0.0"
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
