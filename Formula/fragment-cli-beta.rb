require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2583.0.0-darwin-x64.tar.gz"
    sha256 "da1a83d59ac503d173abff7e16de02d6581a571a8f01739c626fc3c920a09bd0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2583.0.0-darwin-arm64.tar.gz"
      sha256 "ff84057cdb954df969fe2415987ae8433f3277f322f777ce9a9df25c48ba9152"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2583.0.0-linux-x64.tar.gz"
    sha256 "944d6a0ce3fe13ca9d1854f5f166dcb13e25adca0baee1062a5832254fc88591"
  end
  version "2583.0.0"
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
