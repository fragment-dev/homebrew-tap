require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6009.0.0-darwin-x64.tar.gz"
    sha256 "c11277b2ffcb9eb9dc4372fc89f346fd0c1487881b360fd8056f67696c0db55d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6009.0.0-darwin-arm64.tar.gz"
      sha256 "1001dd15d2a0798d10668db57c3701af7308462b25fa9eabc5cd41c69b27382c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6009.0.0-linux-x64.tar.gz"
    sha256 "6f44afd3e248d3a1c4214af5c8a8bef4d664ad1a3c81bf482497a49c5ca614af"
  end
  version "6009.0.0"
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
