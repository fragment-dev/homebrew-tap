require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.21-darwin-x64.tar.gz"
    sha256 "404070c558721ab11ae3bf6f0512d39a855c3c61c161f7d88a9b0ce9b04752e6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.21-darwin-arm64.tar.gz"
      sha256 "077d678407bdb93c219739d130d92501e841f29b2199e7711ed229c9f1f2cd4c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.21-linux-x64.tar.gz"
    sha256 "1165131818b5f7089d6378b6166d5f140d3b1f757233188d46ba50b5924fd9c1"
  end
  version "2023.9.21"
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
