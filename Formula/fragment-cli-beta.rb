require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5165.0.0-darwin-x64.tar.gz"
    sha256 "37bc2c722abd4ec8d6f6e83a6783b96d7a97b89aab09d062b6aa4a9037aeae62"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5165.0.0-darwin-arm64.tar.gz"
      sha256 "1326174eb148e24f0d02a700c4f78915c8b15ab96f0b080877e9cd601c5eac6c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5165.0.0-linux-x64.tar.gz"
    sha256 "0f30f9be89bf79172229732a9306d4a2c9694e5dd597995d40e3f449ebd0ac3e"
  end
  version "5165.0.0"
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
