require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2278.0.0-darwin-x64.tar.gz"
    sha256 "a40b7868030e6041e63b5b494c77f69c7fa36ccf952f9e1e8d5d7efb1f139fb4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2278.0.0-darwin-arm64.tar.gz"
      sha256 "f1a213acc240dfba050cff019d088715f612f6c3e93d18a9e5a11e6e32324942"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2278.0.0-linux-x64.tar.gz"
    sha256 "507690467cd8b95e0ad49640beee2575e9699ae39694c87bdc502d1b0534a61a"
  end
  version "2278.0.0"
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
