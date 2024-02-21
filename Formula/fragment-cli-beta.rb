require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4600.0.0-darwin-x64.tar.gz"
    sha256 "0a6fc6b99c5010cb6646d4da8b5f06c087a8731779e8686e9b8f4087ca903b18"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4600.0.0-darwin-arm64.tar.gz"
      sha256 "182e0cb3a03139298f3270a3256b8f3500777153b8ef58fec5258b4c9300ac19"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4600.0.0-linux-x64.tar.gz"
    sha256 "5a9b39de05fb03af9b79f1ffe0801bdbbe1bf10905f3becb072efb7d2c5f9333"
  end
  version "4600.0.0"
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
