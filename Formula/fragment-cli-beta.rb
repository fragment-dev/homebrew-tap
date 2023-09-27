require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3689.0.0-darwin-x64.tar.gz"
    sha256 "6f98f75330d484f917c01123c7389e5f966c3a9764b2976e31096c898c53cacd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3689.0.0-darwin-arm64.tar.gz"
      sha256 "3f3eb02eb3bc7a1f3ca733cb78f7157b554f37cf2360fb777ba3ea64e13479c7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3689.0.0-linux-x64.tar.gz"
    sha256 "e645ab434a58c1b8484c99cbef879f520d4899bc91b1080321f9fa5e6033f6c2"
  end
  version "3689.0.0"
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
