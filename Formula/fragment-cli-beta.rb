require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2462.0.0-darwin-x64.tar.gz"
    sha256 "e1085510039981f32922fffcc6ecc4447bca16638fe95f6ec12dfe084401cb43"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2462.0.0-darwin-arm64.tar.gz"
      sha256 "b3b7d13d6230febfb8b1710349db303b09e55c56e0a6be251ad00a8c695fb7f8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2462.0.0-linux-x64.tar.gz"
    sha256 "96957ee73681a931bca049266112310d245b2338963f279cf83f3f07447700e0"
  end
  version "2462.0.0"
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
