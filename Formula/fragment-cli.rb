require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.13-darwin-x64.tar.gz"
    sha256 "c85abc1b91642e984aa52e32fd3f3993de45b92c4e6941ba384ee8cfa35428f2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.13-darwin-arm64.tar.gz"
      sha256 "81eb516f6eb509b7e2df79e7c49875bd921b5df8d3008d9928db7ac0b99d4e96"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.13-linux-x64.tar.gz"
    sha256 "b84508ffa8d9af730442c64c1b073361b3e0fc60e8663f466f4d1d501486710d"
  end
  version "2024.2.13"
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
