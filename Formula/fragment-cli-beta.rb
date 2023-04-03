require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2341.0.0-darwin-x64.tar.gz"
    sha256 "0f482e9613de42c7999265181a1777f9cb466869db8669b74d7db03c98192f56"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2341.0.0-darwin-arm64.tar.gz"
      sha256 "e622cd3e7c51f667187989d61a9140cd5ee678d27ec5fc9d0e761456666b7cbb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2341.0.0-linux-x64.tar.gz"
    sha256 "13d3c9b8e2e4c74aa0d8545e563c6b3b56d35f38f8c13a3aa8d578156616ccb0"
  end
  version "2341.0.0"
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
