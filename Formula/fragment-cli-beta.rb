require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2270.0.0-darwin-x64.tar.gz"
    sha256 "cb2ddb55941488a3720a90f38394aea7c0abc4bf6f98314c6857325cfb45a295"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2270.0.0-darwin-arm64.tar.gz"
      sha256 "dfb917fbfa5743d82bd82acd786d9c4298c4b41cbe4fe437bac4da13cb0dbac4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2270.0.0-linux-x64.tar.gz"
    sha256 "093d13f06917d14506df5eb6a797e6a2cdbadc677ef2cce06014d3ed97b6b0f1"
  end
  version "2270.0.0"
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
