require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4093.0.0-darwin-x64.tar.gz"
    sha256 "becf4f8236f41c0aedd06eca79713c85b94554d8f0903415c27220990047bca8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4093.0.0-darwin-arm64.tar.gz"
      sha256 "0fec943eee454b3516afa21b1771adeecc7c30ced1564fd0c271fc719fc11b86"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4093.0.0-linux-x64.tar.gz"
    sha256 "3092b3d92f811527029589fd0eedbd98e0b17bddc3647b05419f288ad2b674fe"
  end
  version "4093.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
