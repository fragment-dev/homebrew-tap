require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2415.0.0-darwin-x64.tar.gz"
    sha256 "d087275b1b1df1b1e9d6d287156b080198760892a8927db8624afe6dbc6f3a88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2415.0.0-darwin-arm64.tar.gz"
      sha256 "faf320b8ffc60457274880935276f07ce6a25f77de59bbf64738e0259d70dad2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2415.0.0-linux-x64.tar.gz"
    sha256 "568b2e5b7bcdc1929778d79db064549a1e1c2a9f90f200c99d27313ac6258fd5"
  end
  version "2415.0.0"
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
