require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5175.0.0-darwin-x64.tar.gz"
    sha256 "8398612cd6d1549a876fe6dbfacc1ecda5c85ba31c647c919c50fb489acdeef6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5175.0.0-darwin-arm64.tar.gz"
      sha256 "0ecbcf1418c8e379a2598855b87a4840cd237c171f789cb710cfe229f3d1ce53"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5175.0.0-linux-x64.tar.gz"
    sha256 "d0a80a3b353500e4af6b00e6021587d3829ee55c13667a70856369e4518b1ae1"
  end
  version "5175.0.0"
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
