require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2715.0.0-darwin-x64.tar.gz"
    sha256 "9f2cf54c2c22389d87f8748aba59958ff1c18e91ff584efe54f5218ec78f7e95"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2715.0.0-darwin-arm64.tar.gz"
      sha256 "5829420629493b29506568376f4b97a184d5ca09b3ad520e98500434364b4a11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2715.0.0-linux-x64.tar.gz"
    sha256 "fa25d52c7472803b62e56d08f1422749a3dbf77c9e7f7b416a1f98a577fc7019"
  end
  version "2715.0.0"
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
