require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2840.0.0-darwin-x64.tar.gz"
    sha256 "d667d74fa09dccfb29b1ef761896f55873e1274957764ed56f04240189f54c07"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2840.0.0-darwin-arm64.tar.gz"
      sha256 "7d78c971bfcb1ad734051edee4ba458a34cb56de8556bb336501a16f075591c1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2840.0.0-linux-x64.tar.gz"
    sha256 "2f3dc1cc9de5d234f3b79b30ef6241f8a66ab5fbb938b411b28d15c5a12c729d"
  end
  version "2840.0.0"
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
