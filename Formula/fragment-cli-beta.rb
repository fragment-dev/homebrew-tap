require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3450.0.0-darwin-x64.tar.gz"
    sha256 "75c7a479652c5805f3c78493cd4331db12689f434658348cead3fe52faafd817"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3450.0.0-darwin-arm64.tar.gz"
      sha256 "97edd5a4c23ddc91ee6f835f8a862b78a94fed9026a7fd2171ef533a6681fe29"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3450.0.0-linux-x64.tar.gz"
    sha256 "efdb48701871689b49d6870b7c952a5b70805eb2f2d7370390c6b554d1b552d9"
  end
  version "3450.0.0"
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
