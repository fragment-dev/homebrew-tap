require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3421.0.0-darwin-x64.tar.gz"
    sha256 "398e7317765dbaffa627000e9b4ca9f5464b25d082612bc2c4ec1bff2907b0d6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3421.0.0-darwin-arm64.tar.gz"
      sha256 "07ee499ece9f0ce45776d3fcf8ddf6c6ed07d3c143d78b850e36d3064d55641e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3421.0.0-linux-x64.tar.gz"
    sha256 "0e7cc823b7ef4082f3b99de0260f0f03edb3467bf219ca329b7123a73220a5ca"
  end
  version "3421.0.0"
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
