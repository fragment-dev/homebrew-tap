require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4229.0.0-darwin-x64.tar.gz"
    sha256 "2ac45d91c88663b3f915b965abfb5e132c5dbd59c7ab34d8fb6267e594f1bc30"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4229.0.0-darwin-arm64.tar.gz"
      sha256 "0f7d923fc4347ec784147d9be5311fcbd49dc07135b5ec4faec1e4fcf132a4ef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4229.0.0-linux-x64.tar.gz"
    sha256 "fa7b457a11d2285dd403a61c64d3f82e899ebff279ce601dc1a7b395c60ea365"
  end
  version "4229.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
