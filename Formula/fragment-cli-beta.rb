require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2822.0.0-darwin-x64.tar.gz"
    sha256 "f37101afea3c0d032437183f06dde13544239483067203bb9e18a73fdb621f51"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2822.0.0-darwin-arm64.tar.gz"
      sha256 "1a6fe51227ed4c0958069a9619844bd44010b50a45b548c9e5541e0df899cf5b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2822.0.0-linux-x64.tar.gz"
    sha256 "8168e1338408eaaf37a3a0895459484bb8ff9bc73b2eac26121d83d798d4789a"
  end
  version "2822.0.0"
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
