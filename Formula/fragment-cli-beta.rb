require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5995.0.0-darwin-x64.tar.gz"
    sha256 "9f50a3fe35bfc6537925715c60373451ff77603dc64b60277dbe8c554acee64c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5995.0.0-darwin-arm64.tar.gz"
      sha256 "be4f5344b419b4b2ad16062b58c22991112c3899074774831672fe2d75fa420f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5995.0.0-linux-x64.tar.gz"
    sha256 "92cd09599284f4bb5fe829c1241014611cf35a429af5ca7ae6eeafe192b3715c"
  end
  version "5995.0.0"
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
