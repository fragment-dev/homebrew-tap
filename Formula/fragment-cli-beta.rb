require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6812.0.0-darwin-x64.tar.gz"
    sha256 "7669cc2ceb9a19a55b50e59f579d4b60de47e1eecdf1b1bddbb048a3ffb60244"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6812.0.0-darwin-arm64.tar.gz"
      sha256 "e7f654ac2af892fb6da0dfe08b4472c465ec611fc2c569045fb007ce15b20826"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6812.0.0-linux-x64.tar.gz"
    sha256 "ba55676b8deb9d3b2303c3eb61ec891f7b0298421c5a21548d68db198c70bfc0"
  end
  version "6812.0.0"
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
