require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2427.0.0-darwin-x64.tar.gz"
    sha256 "1b261a1adc8f58ca6f658bfd0fe12b6a0773c697196bbf5e922ec94daafc858d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2427.0.0-darwin-arm64.tar.gz"
      sha256 "ebc6b4f4814aef4cb41965802d89c923899728a80f3b469d491b16d5bfcd8493"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2427.0.0-linux-x64.tar.gz"
    sha256 "f03f906fd63875526b673b0c1a81c71646127da477433eb9b9580482030b57a6"
  end
  version "2427.0.0"
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
