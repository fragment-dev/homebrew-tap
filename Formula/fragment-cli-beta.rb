require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3174.0.0-darwin-x64.tar.gz"
    sha256 "807692bd2333d3ecacd922b96f1b7b0bab69454aed8ded338615f86e2bc522fc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3174.0.0-darwin-arm64.tar.gz"
      sha256 "0fbf882066689a0397dcafb4077a3d1abb2fd197235a7d671085011e7bfd47f3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3174.0.0-linux-x64.tar.gz"
    sha256 "c0e0489c71e77be09ec55e0e47b1ba5ef5085b40c16ea4c006691381ff7f8572"
  end
  version "3174.0.0"
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
