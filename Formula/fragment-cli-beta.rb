require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4728.0.0-darwin-x64.tar.gz"
    sha256 "e3102a94ce4a00b81b9bc99acc4885bc00593187be1658d32ccc9cb473f7b8aa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4728.0.0-darwin-arm64.tar.gz"
      sha256 "9efa92ccba76bbc8630e8bfdeec580c87b1e924c890ce07a4d24fb09ec6feb35"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4728.0.0-linux-x64.tar.gz"
    sha256 "888511039c86389608123058047414c00160d45a54de949d761b2f1a174c9cfa"
  end
  version "4728.0.0"
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
