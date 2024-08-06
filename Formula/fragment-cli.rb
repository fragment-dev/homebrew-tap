require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.6-darwin-x64.tar.gz"
    sha256 "d10a968b6d9b3cd58f1a33cc750345caebe9280491b20261e6e76d05ba3c65b0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.6-darwin-arm64.tar.gz"
      sha256 "9b7657904e407c4e5ac9e331588a88d927dc4f152508397d3b027effc59aab20"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.6-linux-x64.tar.gz"
    sha256 "5df65275a0b8f72d9579d814e96afa4784c549c7c51deaf5486f078403f97a56"
  end
  version "2024.8.6"
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
