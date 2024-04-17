require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4911.0.0-darwin-x64.tar.gz"
    sha256 "dc3617f5e21094af26ba53f320cb00055761e96d9718a6e84a34734fcb51bdec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4911.0.0-darwin-arm64.tar.gz"
      sha256 "94b0447fbaf85fbdbf26a2987a202a473cff07d7e2f5afde882136946204fc00"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4911.0.0-linux-x64.tar.gz"
    sha256 "914dc95d7898e467af3560395a676b74b179cb96897be75b261250e25643ab99"
  end
  version "4911.0.0"
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
