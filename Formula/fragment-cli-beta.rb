require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5509.0.0-darwin-x64.tar.gz"
    sha256 "6a0fdca557ed6aa8c5a35d916d9ddade4edcf0938a5bd33a248ee36c16d64fcf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5509.0.0-darwin-arm64.tar.gz"
      sha256 "38bacc324e06f9a6eef0c4bedf4fdaa285ba0b961a78d979e61acb54e0b80ef9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5509.0.0-linux-x64.tar.gz"
    sha256 "5e36f16636710b1abee9bf5694c7f0fab603eb22d1e17030438622e1811b0186"
  end
  version "5509.0.0"
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
