require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2686.0.0-darwin-x64.tar.gz"
    sha256 "143944150b5d322d0eb770b164a38b1831f31afd71e4c9b2467a5ca2abf23b33"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2686.0.0-darwin-arm64.tar.gz"
      sha256 "f10473f1b439ca0cf69f8c6298763a2c310727a890499dbb759ea652c061ab6d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2686.0.0-linux-x64.tar.gz"
    sha256 "b64e00132597e930ca2a5b82df0b4d30e488c989d59b3dbc7a24c92df746f767"
  end
  version "2686.0.0"
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
