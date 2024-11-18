require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5778.0.0-darwin-x64.tar.gz"
    sha256 "dc9991108a32e56987910a8ca20295030fec1d3827d0464b1820caa4eb73eecc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5778.0.0-darwin-arm64.tar.gz"
      sha256 "69ea0b2ba5cde88a57de897487e88a5a337fb49d69bb132f0443aa1d679c2509"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5778.0.0-linux-x64.tar.gz"
    sha256 "fb096322f940800256dd468831ae95153c64c2944672f57892db5f62c7cd1ce4"
  end
  version "5778.0.0"
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
