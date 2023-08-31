require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3459.0.0-darwin-x64.tar.gz"
    sha256 "a5619b6d6c1a766e9471d7ccd6a4761d65e18b167f18731ca83bd9b245014afb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3459.0.0-darwin-arm64.tar.gz"
      sha256 "abfd9350fbefe36640abc7937a2eb50e86ee826fde3164c49c3d4f0c92240ec3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3459.0.0-linux-x64.tar.gz"
    sha256 "41cf0bf0123747f15b83e4f55a15b610a28e2548ec113b29e0b53764ed66eeab"
  end
  version "3459.0.0"
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
