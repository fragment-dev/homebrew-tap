require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5384.0.0-darwin-x64.tar.gz"
    sha256 "08b3939b1b06e8fb11d14e67080cf71b896f00b83962d33f4d3cabe1206f9024"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5384.0.0-darwin-arm64.tar.gz"
      sha256 "3e8f63e976cdb390e2812bfc3fa68748d7a253dd37d8626a85272544fd001e23"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5384.0.0-linux-x64.tar.gz"
    sha256 "6c86d4b327a114d669604d78ad47243031ca98d4217e840038a4b77f9a234839"
  end
  version "5384.0.0"
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
