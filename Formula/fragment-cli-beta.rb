require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4096.0.0-darwin-x64.tar.gz"
    sha256 "9d6da848359fe247afe3e7553b7917018539496651129f39e66db1357e5859aa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4096.0.0-darwin-arm64.tar.gz"
      sha256 "81161e8009fd1cf800e547dceeb7b896fba43ae364975fb50290855f1e45ceaf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4096.0.0-linux-x64.tar.gz"
    sha256 "398888359df7f767995fa05905cd4edb69f5f1868faa2a25d14059125f81d463"
  end
  version "4096.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
