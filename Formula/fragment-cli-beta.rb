require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5398.0.0-darwin-x64.tar.gz"
    sha256 "0f5406bf384b5936b6c66f590399c452e98f519b90d25bf0e4385e141b3f3dbe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5398.0.0-darwin-arm64.tar.gz"
      sha256 "f961c17221b2bc7cd8a303984bdf62fb7972710a6b076264f55c7058969a2acd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5398.0.0-linux-x64.tar.gz"
    sha256 "61e1fc2cc443e7a26387379711dc53c640e728737778164f4a0c3938a60835b5"
  end
  version "5398.0.0"
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
