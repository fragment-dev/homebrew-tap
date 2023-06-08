require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2823.0.0-darwin-x64.tar.gz"
    sha256 "50581ff1f588a0b845894abd2529ceffbe43349a77644fc3375711c503fc9611"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2823.0.0-darwin-arm64.tar.gz"
      sha256 "c3dd1cfc1682c8a49bfed347501090afa5bf631aa8da10fa407970bd3592d3b2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2823.0.0-linux-x64.tar.gz"
    sha256 "283ea41cfd5bcb2e4012ce9573f76fdec3ef2e6eec4636ae25a4761c2edeb0fa"
  end
  version "2823.0.0"
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
