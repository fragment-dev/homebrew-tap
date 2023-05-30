require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2759.0.0-darwin-x64.tar.gz"
    sha256 "f3c6b6a16be63da932617e5876d918466844bcc15553022a3c896eea9cf21ecc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2759.0.0-darwin-arm64.tar.gz"
      sha256 "d7535a468a497617b89f9565861ff75ae32ba638c8090762ed7330a5db7e46da"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2759.0.0-linux-x64.tar.gz"
    sha256 "a5a68aa529080bea257fd0184630799bca7af621889040a594158e5c5b89d7a0"
  end
  version "2759.0.0"
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
