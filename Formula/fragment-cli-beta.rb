require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2858.0.0-darwin-x64.tar.gz"
    sha256 "e01ed4ba5b067d14bd2e18cc957af5d8528788c80c289cf8ab65c15cc8334e3b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2858.0.0-darwin-arm64.tar.gz"
      sha256 "a863e5a23648d54ff728ba8825b05da0b1c7db53ad6558ade4506ec7a0515680"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2858.0.0-linux-x64.tar.gz"
    sha256 "ce6a45a9e1929e999d2ae82e263231c4402e5eeb07b4ef7fb735ec92c59ec939"
  end
  version "2858.0.0"
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
