require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6137.0.0-darwin-x64.tar.gz"
    sha256 "f28020d1714ac78bd0efaa817288343fa508ca9c63233318934a03e6d78d944f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6137.0.0-darwin-arm64.tar.gz"
      sha256 "b32323a53a1ac0c13185f9b6f2f4f58e3ec3bb05cd8a7a9cb9df73afa7b8e2b2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6137.0.0-linux-x64.tar.gz"
    sha256 "18a8dad220b59418a582f7ff593c1c0438e981d82969c89fde441578e0705481"
  end
  version "6137.0.0"
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
