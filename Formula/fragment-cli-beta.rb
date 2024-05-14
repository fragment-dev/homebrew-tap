require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5052.0.0-darwin-x64.tar.gz"
    sha256 "0d8d20e98af0649d515febcbd53055dd372ceaa1a54cc7346695486131d5b99b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5052.0.0-darwin-arm64.tar.gz"
      sha256 "055793c194423595547ee6080a6dba153356b683f1dc2b1f8435168c2e973253"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5052.0.0-linux-x64.tar.gz"
    sha256 "d484869984a29d092a327fad1f392a6ace75485cc9a094e3d4b8f94259c9ea58"
  end
  version "5052.0.0"
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
