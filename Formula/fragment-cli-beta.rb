require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2326.0.0-darwin-x64.tar.gz"
    sha256 "81d2f46d8b5e2f81a410593522598fea13a48320925f19ae6ac883bd57f152cc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2326.0.0-darwin-arm64.tar.gz"
      sha256 "369c3a2d25d6de513cbf414e3fcb887146f55253a0e8975ff2586bdb4c5e4b11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2326.0.0-linux-x64.tar.gz"
    sha256 "79af6e64734ec5020baebacb8f2cee6657564fccd13517aaef5143c5b063d06b"
  end
  version "2326.0.0"
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
