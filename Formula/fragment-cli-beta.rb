require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3027.0.0-darwin-x64.tar.gz"
    sha256 "762a9a2d1c84f9f50462baaa044c80b6a291a6a68032eac142adf3eca59a6d36"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3027.0.0-darwin-arm64.tar.gz"
      sha256 "e79bb5e0fd13115b2a281f70eb2dcad3aecd400d20be16b5b564374e6a3cfb5e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3027.0.0-linux-x64.tar.gz"
    sha256 "3426f197c40a21328cb5cc624052926c61bfff2464f890139f4a05a7971287f9"
  end
  version "3027.0.0"
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
