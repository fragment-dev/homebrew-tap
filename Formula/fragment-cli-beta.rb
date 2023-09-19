require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3613.0.0-darwin-x64.tar.gz"
    sha256 "f66a38e834b9f50e9c8c3baa1c0dffb72ca579d27f96fa90c53743d814fcd313"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3613.0.0-darwin-arm64.tar.gz"
      sha256 "74786fa19ed9831661115cc6f463ccc1c4198bcb4939f35f303e8caf37138639"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3613.0.0-linux-x64.tar.gz"
    sha256 "9f159dedea3dead7e4b2c667a052be89fcfc7defeb4b1c21308c653dc2c938f7"
  end
  version "3613.0.0"
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
