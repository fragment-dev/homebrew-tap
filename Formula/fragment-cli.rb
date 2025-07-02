require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.7.1-1-darwin-x64.tar.gz"
    sha256 "1ccc99161009420972fa2afa6347a1b6ae5d20e0c66287e13ec91582f3b7d06b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.7.1-1-darwin-arm64.tar.gz"
      sha256 "10bcc1f4f0cc4008f858b90c27cc861ada216f704cf8bfb99671377ebe921bb3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.7.1-1-linux-x64.tar.gz"
    sha256 "575e2b2dbd7ca23ff6473c71963dd577928d907a1be7b2ce2161ee9c7dc72de9"
  end
  version "2025.7.1-1"
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
