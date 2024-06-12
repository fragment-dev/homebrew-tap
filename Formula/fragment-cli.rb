require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.11-darwin-x64.tar.gz"
    sha256 "fd359bfc5134ba12c25f67400829e1495f38dd73e1c86abc584c9350a2ddb05a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.11-darwin-arm64.tar.gz"
      sha256 "3ae52eb7d4c3c1617b499890c92f52b2150e212f518c5ca30b0f5bb3c1dfaf07"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.11-linux-x64.tar.gz"
    sha256 "28af87666a86eb6fcc0ac84e7e531e3df80a0c3f7f1a8db3fe4f5095f7854cdb"
  end
  version "2024.6.11"
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
