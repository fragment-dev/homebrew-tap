require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5901.0.0-darwin-x64.tar.gz"
    sha256 "d37dc81a3ba51826c9d4ab03c4b2715af8fac492e993747c94687b67603a7a4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5901.0.0-darwin-arm64.tar.gz"
      sha256 "eb2b2445caec07c3173ae463b934452563f824cdda601c3ee617b7e5d9c5b583"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5901.0.0-linux-x64.tar.gz"
    sha256 "7baf1559b0aaef71bc474612fdc87903f41c5b764c0227cbde4bea04235904f7"
  end
  version "5901.0.0"
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
