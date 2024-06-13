require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5276.0.0-darwin-x64.tar.gz"
    sha256 "ff011dffe875725d7263ee3c1900ff2b36f51603f18e16383a40a3026c82072b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5276.0.0-darwin-arm64.tar.gz"
      sha256 "ef9a0f2f483dc441599e05a53bbb25e892ee7ce4c67a1a1fc0eb29472e09db65"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5276.0.0-linux-x64.tar.gz"
    sha256 "50726de0fc7375da51d5cfbd46eb6a9a19d932b2012fc41382244158e53de19b"
  end
  version "5276.0.0"
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
