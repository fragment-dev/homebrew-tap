require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5300.0.0-darwin-x64.tar.gz"
    sha256 "224a2b07919c16db4032d3819a005b523dfd06e5ce1d7bb6fd8f013a9971a5fc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5300.0.0-darwin-arm64.tar.gz"
      sha256 "65ff85c7fb5fb189ecb61134edc7a8ebe25e97f6401c5ff099a636847c46ddad"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5300.0.0-linux-x64.tar.gz"
    sha256 "a49fe63f9651dd7c5e101ecc6cffae96d697ffee5f281d3c575c035e282b3cc8"
  end
  version "5300.0.0"
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
