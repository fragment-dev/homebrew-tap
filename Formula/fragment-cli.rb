require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-darwin-x64.tar.gz"
    sha256 "17606f29a20dd75bf53baea042af064add4cec28865b8051843a5ff9df1c1f40"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-darwin-arm64.tar.gz"
      sha256 "aef3fa6b3222c307cbee6b71092eb606303b52affc317bc311cace738ed7fce8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-linux-x64.tar.gz"
    sha256 "50d925d39390e6f59012338baf859f5254bc0118097b37a2b2883395e37eee00"
  end
  version "2024.12.24-1"
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
