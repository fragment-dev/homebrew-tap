require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v7005.0.0-darwin-x64.tar.gz"
    sha256 "48c78ef90f3514430d03606d863829cd8b67776e6a5e04d89999ba2036eaca31"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v7005.0.0-darwin-arm64.tar.gz"
      sha256 "390b40123564d2519e68e7a9c794f688eded5038df2854c2d73a07609655c0c9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v7005.0.0-linux-x64.tar.gz"
    sha256 "9fb4130d1f984e239dd667a4a025215a091bff8a27a1ba9e8d88837f728e9b4d"
  end
  version "7005.0.0"
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
