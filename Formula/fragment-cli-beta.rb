require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4822.0.0-darwin-x64.tar.gz"
    sha256 "cdc1f31b20a3b0a6fbe4cdeb7e23070c1c757a139d82a47f19c3731597c466d3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4822.0.0-darwin-arm64.tar.gz"
      sha256 "e1a81c5d855058e59874fd5c039d2e98e9a0fe2b5ecd47cf2087f946d5903804"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4822.0.0-linux-x64.tar.gz"
    sha256 "7856500c1f869e4eb1457143347af6f2933049af7fd8ad749434e609d0cf3ade"
  end
  version "4822.0.0"
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
