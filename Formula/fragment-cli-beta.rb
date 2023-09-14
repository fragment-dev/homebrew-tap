require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3559.0.0-darwin-x64.tar.gz"
    sha256 "c30ebb00c43096cbc8643b6a030ea43a483dd549f19e062b60d2ae24b75985e2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3559.0.0-darwin-arm64.tar.gz"
      sha256 "7a18dcbb84d3faa9073897bebf077e258499e47c4ac5f61df7f8c282d9c1dcb8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3559.0.0-linux-x64.tar.gz"
    sha256 "ea22ef3c954ab7e40e4f254e71cf874bbcd4bd8e6e180706fa93493fbff71c36"
  end
  version "3559.0.0"
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
