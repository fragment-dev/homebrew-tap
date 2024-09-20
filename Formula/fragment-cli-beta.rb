require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5612.0.0-darwin-x64.tar.gz"
    sha256 "8ff34ece821f6cb483d299dcb7b848a5df0a970c81d7737970f91e9ce4b68809"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5612.0.0-darwin-arm64.tar.gz"
      sha256 "8f604e803d577514d1e15193c19ed9696598d39643ca0dcbfe52bb5b1fe6f7fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5612.0.0-linux-x64.tar.gz"
    sha256 "407f2f35c6dbd3f6c13f16599156383028007154edd2bbe2b1397d81c9b71e25"
  end
  version "5612.0.0"
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
