require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6018.0.0-darwin-x64.tar.gz"
    sha256 "d1a914e6985d87d75e07039d4fa22115a4f31a6db3cae50231dcc6800a672906"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6018.0.0-darwin-arm64.tar.gz"
      sha256 "c896000c20cfa189cd544e9ff4a0b710e36bde317dc07cbbbd4986f6b6b5c10d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6018.0.0-linux-x64.tar.gz"
    sha256 "940a2c4c0a001fdc9121e98a4a5038b981f78842d8feee13da4875c70bde2926"
  end
  version "6018.0.0"
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
