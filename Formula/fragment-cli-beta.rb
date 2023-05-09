require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2612.0.0-darwin-x64.tar.gz"
    sha256 "b2c69d138293f26e7ce1e2c0f407c610645cf0330c1bfce1adaf8338275bce36"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2612.0.0-darwin-arm64.tar.gz"
      sha256 "53afb20fe739d47156e69aee9c125d4f3a0da64aa076b707d7b063a69ea2dfb6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2612.0.0-linux-x64.tar.gz"
    sha256 "11835085ad296804f4b931615a00bcb3c12927f7a250e1326becfefaf7f1fa2b"
  end
  version "2612.0.0"
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
