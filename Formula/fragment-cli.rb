require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.7-1-darwin-x64.tar.gz"
    sha256 "473906068ae1668367e537b1cb840d84799dfff69fedc4fc7d2b85ac9ceaaf7c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.7-1-darwin-arm64.tar.gz"
      sha256 "0a78ec7181f926594197b4397fa978412fb5ba180ca73fd7575af245e8024fb7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.7-1-linux-x64.tar.gz"
    sha256 "0e96f0c90566eeabfbab5a3a1d16bf5602c2c54f0af060820f14cba39fc51b32"
  end
  version "2023.9.7-1"
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
