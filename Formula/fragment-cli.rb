require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.6-darwin-x64.tar.gz"
    sha256 "58d5a4e010aeaaa92959696d1d149391579d86e2177c8d3a87efd04e98d245a1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.6-darwin-arm64.tar.gz"
      sha256 "149c7da0764008bf4fc031fbad45d30ae89bddcc3ee6e7ee6678f71a71430ff1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.6-linux-x64.tar.gz"
    sha256 "aba53a7f41f1c6505cb926edc947c2f838b1253a756197dc71dd0970b475909e"
  end
  version "2024.2.6"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
