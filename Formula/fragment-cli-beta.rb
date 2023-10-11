require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3805.0.0-darwin-x64.tar.gz"
    sha256 "000a7dce03c2c60e428c3040b051e26eb31aa1fa929b13652b5f47fc6e52e8e1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3805.0.0-darwin-arm64.tar.gz"
      sha256 "6260230fe12222544073b9e46808a71a244f18c2bf6fe40b059fb222464489e3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3805.0.0-linux-x64.tar.gz"
    sha256 "24915e65f9a28a431fa3a2f33048dd3880baf74b44d13e04f424814f49609358"
  end
  version "3805.0.0"
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
