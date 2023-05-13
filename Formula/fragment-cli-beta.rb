require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2660.0.0-darwin-x64.tar.gz"
    sha256 "5fe821d944466e70b4ffc99a7bbf18a63689d09741e70adc75212e53cb911266"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2660.0.0-darwin-arm64.tar.gz"
      sha256 "7c6cbf5b710c1bb04e17b33c0bd02a4edcab9841f6800e2b39fc258fc8cfa868"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2660.0.0-linux-x64.tar.gz"
    sha256 "c25fc9779c4177d9a502af5f7a341f6b3e6fb9676eb534006c747fd8a84796d5"
  end
  version "2660.0.0"
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
