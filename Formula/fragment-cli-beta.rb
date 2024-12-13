require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5882.0.0-darwin-x64.tar.gz"
    sha256 "8962fa5485743dc60625e54a01ce871d4abf17a8048674a6f40dd305bdfc2741"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5882.0.0-darwin-arm64.tar.gz"
      sha256 "00ba11bb2fae5ee67da3337a87b6df9421f98de91ccf6f124eb6c3fc860c5425"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5882.0.0-linux-x64.tar.gz"
    sha256 "f235b14b03b1604336f8439cb8e6bf5a1d7fd6964527a1920ab66d24a8de705c"
  end
  version "5882.0.0"
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
