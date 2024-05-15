require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5068.0.0-darwin-x64.tar.gz"
    sha256 "ea351172d4f49460d15f67b96abd961e9e99e1d893e55be11ddec6cc05f31c21"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5068.0.0-darwin-arm64.tar.gz"
      sha256 "7af4cb378821ec8c0ec9d554d9fa767c4a1b15232ef9f75e47cd62a2d2796236"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5068.0.0-linux-x64.tar.gz"
    sha256 "48eaf6085e64b615296833f5807a3e6feae050fc609b680c651f6fc393830a63"
  end
  version "5068.0.0"
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
