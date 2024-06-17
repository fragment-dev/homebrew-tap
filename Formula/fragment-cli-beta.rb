require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5288.0.0-darwin-x64.tar.gz"
    sha256 "674708fa53dcdbd9b7d7efdd3c5ca417fea4ed255763674702da0e65de8819dc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5288.0.0-darwin-arm64.tar.gz"
      sha256 "beeae32eeb179b5e8ad5393f8888aca3c5e4f895e2ca6d8290737eb412bd95de"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5288.0.0-linux-x64.tar.gz"
    sha256 "dc90a5ae16f07a473926878c362cd3701ae423b1e8be72dc6fdd0819d3a68681"
  end
  version "5288.0.0"
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
