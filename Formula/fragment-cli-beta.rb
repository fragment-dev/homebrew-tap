require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5400.0.0-darwin-x64.tar.gz"
    sha256 "83d7847e7b398c7acbc93cad5b5678a3926f2d7ac36b39296c85ffb9f7de80d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5400.0.0-darwin-arm64.tar.gz"
      sha256 "2d37c474ffa869d82d2d86249aca367b1c8959a0d17624b72da06eb06b4c0400"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5400.0.0-linux-x64.tar.gz"
    sha256 "1d7d5428a16d212ae63b9bc207abb6e83e36f2f00ee09046903422f43859cb65"
  end
  version "5400.0.0"
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
