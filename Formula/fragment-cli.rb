require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.3-1-darwin-x64.tar.gz"
    sha256 "a4539cf2d6ee42a6d29ef617f0a46c2437a24dd0949db568dc37a0372efb2998"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.3-1-darwin-arm64.tar.gz"
      sha256 "b30022845b717d230ffa486eebb29b165584150d9d04f739e26519e33bac8fd2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.3-1-linux-x64.tar.gz"
    sha256 "09bd218dc413dc39df3ea56b07ef7680e839fdb3a0388c57afbda9eae7c8cb59"
  end
  version "2023.5.3-1"
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
