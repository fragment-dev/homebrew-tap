require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5878.0.0-darwin-x64.tar.gz"
    sha256 "b4f2cedceec2cb6a2d350baba093d8e0738fc13d3872f3fdd21e1ec99cbfa545"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5878.0.0-darwin-arm64.tar.gz"
      sha256 "525455e1f0c42cdddb60a9ba2d81285f8566f2388d8fcb8317eb1661cb70329b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5878.0.0-linux-x64.tar.gz"
    sha256 "0a7e7e8d47e36885dcc2ae8109a420d09dd3cbbeeb81f85299765cb119f62c5d"
  end
  version "5878.0.0"
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
