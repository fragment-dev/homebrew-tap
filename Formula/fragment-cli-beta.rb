require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5752.0.0-darwin-x64.tar.gz"
    sha256 "7ea2daa86381b001da7429548343783eab1b1f4fe62189e5dcee1bb7aa415f8e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5752.0.0-darwin-arm64.tar.gz"
      sha256 "d3ad4f0bc3dc96f165b191f67a9c6837f22bc24b6d71f78f48dc777df5436de1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5752.0.0-linux-x64.tar.gz"
    sha256 "931852df23f0c3f215d3abf8d6ca61ad3f28523db3179de2a87afab0b7c002df"
  end
  version "5752.0.0"
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
