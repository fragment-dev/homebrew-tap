require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6014.0.0-darwin-x64.tar.gz"
    sha256 "d65e71606303f876a87dada720d8daaba9566cee7d39555e181cee43f4cb54fc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6014.0.0-darwin-arm64.tar.gz"
      sha256 "c164106440a776ade755fc2e34e64e1062d6488226a7da1073f990b3bf96b231"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6014.0.0-linux-x64.tar.gz"
    sha256 "4974c709799eb5d527b784b9292391c70e0ada7f3bed5e0c0ae00038a47b65dd"
  end
  version "6014.0.0"
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
