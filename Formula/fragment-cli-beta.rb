require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5649.0.0-darwin-x64.tar.gz"
    sha256 "95bdf0c02cfb8cc35efca8d463c2cb57d2a0cb531249a89e4f66154924c6b765"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5649.0.0-darwin-arm64.tar.gz"
      sha256 "28fbc7365c12260aeea5cbc47668ba0306bc74fa9776c8e0913c02d030d32fa5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5649.0.0-linux-x64.tar.gz"
    sha256 "97f925067cff2d2f3d755f9bb8473b06a3deded5009d524a01ad7eaf8763fdaa"
  end
  version "5649.0.0"
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
