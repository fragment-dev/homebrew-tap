require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2835.0.0-darwin-x64.tar.gz"
    sha256 "6247695fc0f5ff92df416aaec1e5870b76c67cc9c4bdd5a5a30665f81d6a2d03"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2835.0.0-darwin-arm64.tar.gz"
      sha256 "032d347bd2e8f230541d335e3317f80d21a3fb2fa78969e2ff8f3836d61c88db"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2835.0.0-linux-x64.tar.gz"
    sha256 "f2524db01d3573235b81cce83c2a0a1ac568e80222e6898d3d1d7393604166e7"
  end
  version "2835.0.0"
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
