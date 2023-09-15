require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3572.0.0-darwin-x64.tar.gz"
    sha256 "3f9dd777e853758d07377f547dfb489e6458343238dcb2d2de5aa9ffee52c83b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3572.0.0-darwin-arm64.tar.gz"
      sha256 "95ae937c496f651a66274ccb44c43d9a7069f5884627bf4c0fb207871ddfd1e3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3572.0.0-linux-x64.tar.gz"
    sha256 "bad712db28986ca639a16074cc85c1d7a7e8add68bb9a1c565aef3a0d0b39f78"
  end
  version "3572.0.0"
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
