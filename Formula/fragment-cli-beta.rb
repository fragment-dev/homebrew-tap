require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5829.0.0-darwin-x64.tar.gz"
    sha256 "9d3ce5b0e13e70b19925636c13d2a69ac7c96053e5004a24d413dff84f912182"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5829.0.0-darwin-arm64.tar.gz"
      sha256 "83a1f6d0d431ab7fda008c9ef96dbc65a4f390c452ecf650fe0e17805cdcc3df"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5829.0.0-linux-x64.tar.gz"
    sha256 "c255cbbdb257afc4e86e605e2eb4102b07fd7508dbd54dfd8b0b3dec90766844"
  end
  version "5829.0.0"
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
