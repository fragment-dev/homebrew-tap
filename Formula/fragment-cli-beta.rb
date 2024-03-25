require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4809.0.0-darwin-x64.tar.gz"
    sha256 "93b1fe29f27c6ef0c6262aea6f6486087da1cf4f247f1b2f6ce94c27ef7fa87a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4809.0.0-darwin-arm64.tar.gz"
      sha256 "ac0535bc62db3cc4fd216f7fb2601d80af84269673139aa506d342ef31d1f28c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4809.0.0-linux-x64.tar.gz"
    sha256 "7190d9f9ad67b40400481cfd45980da36400c1342f3252ac6ff8119ac7e6edf7"
  end
  version "4809.0.0"
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
