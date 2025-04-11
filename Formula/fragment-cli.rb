require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.4.9-darwin-x64.tar.gz"
    sha256 "950cfd99fbc0f1382cba59b6efcc6604fbedfdeb2e6da294788142ad133453d1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.4.9-darwin-arm64.tar.gz"
      sha256 "0a2d88d6f7be5592b6133f0c7611cd66b520bf70b0f6bd23492dd2804037222c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.4.9-linux-x64.tar.gz"
    sha256 "5655adc39b9665b0a540abd8b53ac3691e828d65778a12e7013f86ebe10fcd37"
  end
  version "2025.4.9"
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
