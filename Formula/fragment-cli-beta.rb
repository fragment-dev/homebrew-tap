require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4526.0.0-darwin-x64.tar.gz"
    sha256 "0ac57a6f9bb74a67f1e717f6adfecbda04d3706cb715a38f7f8378baadfe7211"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4526.0.0-darwin-arm64.tar.gz"
      sha256 "889a895add3df53dd0c69a52da8ab5bb28c5c2c3593047d19d9526213fc23b8a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4526.0.0-linux-x64.tar.gz"
    sha256 "3f7b80868a88ee4ecc24324fd5b26129d14e7645f076bece7614a8a496fb852f"
  end
  version "4526.0.0"
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
