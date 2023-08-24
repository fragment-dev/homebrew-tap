require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3379.0.0-darwin-x64.tar.gz"
    sha256 "c9f22c642078ac79e7d6365e523edb647edcdc98657d3c2a277ff78e792c99d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3379.0.0-darwin-arm64.tar.gz"
      sha256 "d257d50af464393fff24476304666c27b821779bfcb1eb298843c083522a34b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3379.0.0-linux-x64.tar.gz"
    sha256 "2c5e880aa0523ff8e82e403c7778b969f78455bca8121754702d009b2acc2a7d"
  end
  version "3379.0.0"
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
