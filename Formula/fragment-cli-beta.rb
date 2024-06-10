require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5249.0.0-darwin-x64.tar.gz"
    sha256 "2d4d1e58eced7cde56eac87e8fdee998d382655bbd902042c8a28218c12e7a38"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5249.0.0-darwin-arm64.tar.gz"
      sha256 "d18f78d384358832805f3af357cbcd40ad9ae0e72f6569e52d330c6dd9c15059"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5249.0.0-linux-x64.tar.gz"
    sha256 "10f15c2fb57559e49ca8175b5ef7475b60b9986d3198b34a1161dfb88125d165"
  end
  version "5249.0.0"
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
