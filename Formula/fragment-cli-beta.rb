require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4630.0.0-darwin-x64.tar.gz"
    sha256 "f6c1c6194a325e769fa58898b3ddb1cb7d09da8ffee669b70579e85b2fe48b9e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4630.0.0-darwin-arm64.tar.gz"
      sha256 "6f201b79cdd9fb260e16b449f6953e287192b1b48f15160177bb02f825d13b47"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4630.0.0-linux-x64.tar.gz"
    sha256 "cd2885a0beca6ba7473a43f3f417d6eedace45dbbd89979a49302204a2d12dee"
  end
  version "4630.0.0"
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
