require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2824.0.0-darwin-x64.tar.gz"
    sha256 "e446808453e88d2154ef83e4eef9334e2b531b1fb65ed5393f0977e3a32323d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2824.0.0-darwin-arm64.tar.gz"
      sha256 "003bf04b1fe6cb6bc8218529c0d2e119ca3b6d13aee7169acea92d1abb514e84"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2824.0.0-linux-x64.tar.gz"
    sha256 "87919bcee73b6e440c7b7439c5fc567c4b5608c27b8250118e385b87b502e0d0"
  end
  version "2824.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
