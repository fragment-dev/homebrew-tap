require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5482.0.0-darwin-x64.tar.gz"
    sha256 "509fde4b1b283617df40c826157e98832f7d9a38ff75d438636163cdbadbd183"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5482.0.0-darwin-arm64.tar.gz"
      sha256 "f4deb19f3cb590bee76325cebd7fd360a44523eaddda02c6352e763642bf3f58"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5482.0.0-linux-x64.tar.gz"
    sha256 "2ba775b04c74e4f4f6ab7c3b4beabbeceadcc94897bb3df657040fc251f484c5"
  end
  version "5482.0.0"
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
