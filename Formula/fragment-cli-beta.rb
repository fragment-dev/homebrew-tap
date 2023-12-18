require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4159.0.0-darwin-x64.tar.gz"
    sha256 "392faba6363ff641856e9ea379b4079c07c55f73d59782ef157c91499610713e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4159.0.0-darwin-arm64.tar.gz"
      sha256 "e76b8064e7fd3530ac8afe95bcfb95188e7b5ca2a8ef563fb6999e6efe4c83b8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4159.0.0-linux-x64.tar.gz"
    sha256 "393d79badb1eebc5a789a925d4f57b4e48ec2d52b3dae000a5a5c83593c98f15"
  end
  version "4159.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
