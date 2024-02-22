require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4614.0.0-darwin-x64.tar.gz"
    sha256 "41141610b98feaedc44806604b00f3f6d2f25d892f58b92005729c3fd5f6253c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4614.0.0-darwin-arm64.tar.gz"
      sha256 "22b6b4f5d90716a391b0c02dc5eeba495fa1bae3df7e5fa82393ae5a0fd5c4b1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4614.0.0-linux-x64.tar.gz"
    sha256 "e2c352544f7404f617b076e71fa3609d07f12e52e84229fba615a1a4f13e57d2"
  end
  version "4614.0.0"
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
