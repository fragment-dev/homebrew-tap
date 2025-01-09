require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6056.0.0-darwin-x64.tar.gz"
    sha256 "79c19ae716c0f9e7baf250e34d0a0307ca36770160fcd0f5a893c107faad3454"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6056.0.0-darwin-arm64.tar.gz"
      sha256 "f1c22e343346be451a7c58c5acc7ce76d5ade63f0c2cfe132008bce51b2a9c89"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6056.0.0-linux-x64.tar.gz"
    sha256 "22268649587d67e2ff68529bb63f622cfc22d4ae3e15d121c7864358ada96f52"
  end
  version "6056.0.0"
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
