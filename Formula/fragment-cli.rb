require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.13-darwin-x64.tar.gz"
    sha256 "e6eebbee67ba62eddf6a32f5575681f618ed3d60bab0def2a88f9e17b6a46c68"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.13-darwin-arm64.tar.gz"
      sha256 "c6148df43f9ebb72cc3442df95e6f762367fbbba9d25db69b49df2defdb0121e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.13-linux-x64.tar.gz"
    sha256 "51e54835b1184f3e1be719366ed0d5211e57561f1155e63c225c8a20cd02049d"
  end
  version "2024.8.13"
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
