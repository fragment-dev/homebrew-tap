require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2960.0.0-darwin-x64.tar.gz"
    sha256 "c33a1f8664ef1ce2e451c2a8456e86d76591f4bc59f1811b1e80fa3344153a37"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2960.0.0-darwin-arm64.tar.gz"
      sha256 "10d755e16b30c743353c04a0235040b7c927eca0731dee80d03da4ac77e05fca"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2960.0.0-linux-x64.tar.gz"
    sha256 "c27add911339452dd99c50d7a682cbfc922df9738cbc6dc1530e9ab9b5b7e827"
  end
  version "2960.0.0"
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
