require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2748.0.0-darwin-x64.tar.gz"
    sha256 "6a4b76bf9b8373a143c580ff220492170197b460b615f53f6ba00d00204bbe76"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2748.0.0-darwin-arm64.tar.gz"
      sha256 "d038ed371b8b8641c4ec9282331be57331d7f531fcab08203285e7cf222f647b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2748.0.0-linux-x64.tar.gz"
    sha256 "826af09549c0537672feb29d3726f0c8f1e4cae32e447ed4ca116c2360fe1fb9"
  end
  version "2748.0.0"
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
