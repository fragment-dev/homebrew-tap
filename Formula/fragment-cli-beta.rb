require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4806.0.0-darwin-x64.tar.gz"
    sha256 "3dd32d3d85c8a9f85fc2716b66e1de5436ad9a3dce7042b131e2d6b7bd0337f4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4806.0.0-darwin-arm64.tar.gz"
      sha256 "60736cc42692cc8a82f039db93d6b611d531123eaea97266eda64b145b298cd9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4806.0.0-linux-x64.tar.gz"
    sha256 "0343a11f6905a9c7d752b18f0bde790c954ab15b21f94ac00ede1cc74e538997"
  end
  version "4806.0.0"
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
