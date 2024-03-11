require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4743.0.0-darwin-x64.tar.gz"
    sha256 "3d5b5b7b6295224796d4e8a6f9a965533a6f17b6a00589d83df05e1b63381027"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4743.0.0-darwin-arm64.tar.gz"
      sha256 "e9105d3e588b3f55c061c4fa3dcec76bff2923699eb72027eb0081ff95a7a78d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4743.0.0-linux-x64.tar.gz"
    sha256 "56e86c571f805aa536b0a3ee3e25124f7538e1787f2f7d733fef11da41af4a3c"
  end
  version "4743.0.0"
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
