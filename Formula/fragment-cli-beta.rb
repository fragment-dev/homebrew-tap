require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5871.0.0-darwin-x64.tar.gz"
    sha256 "ba6fe2610450a7860b3c3e7654b3d1187fbe06bc3c43be691d8bdd7f0a2d5f8a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5871.0.0-darwin-arm64.tar.gz"
      sha256 "eb10cec166dd6c1a38a9637d8bfcc216cdb93f74f38fed14a90a6445f639daa5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5871.0.0-linux-x64.tar.gz"
    sha256 "cfa0db10d33df1d2c27ee0cf79e4bfd7a5249f3f9bc9659310370a6bec8aecae"
  end
  version "5871.0.0"
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
