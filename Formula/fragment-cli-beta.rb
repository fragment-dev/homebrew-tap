require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4577.0.0-darwin-x64.tar.gz"
    sha256 "9a4832c4cafd5f12cfaf45cf8f5c2fd1640b166a505ac9ae7a397cf4752d5830"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4577.0.0-darwin-arm64.tar.gz"
      sha256 "5508f1fa90b86fcb7353a33be799b16709224c759d0e59c01b7f5538dbf59495"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4577.0.0-linux-x64.tar.gz"
    sha256 "6345ab36d05cad42b98b0854c6a68474fd2abcf98fa2fe6c24089886009c2c1d"
  end
  version "4577.0.0"
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
