require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5189.0.0-darwin-x64.tar.gz"
    sha256 "7f9623383552884d9b1261e034489d7b302458c05144b7c826e1a943d6c87b6c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5189.0.0-darwin-arm64.tar.gz"
      sha256 "ee53f0d9ca4efb3333ca94cabe8b92b29e58a251b6510d2ea2e2eaf9a65b3059"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5189.0.0-linux-x64.tar.gz"
    sha256 "3a3b82c23061751c7b277550042c691a13975d659ad661dc584452dc98cc19a8"
  end
  version "5189.0.0"
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
