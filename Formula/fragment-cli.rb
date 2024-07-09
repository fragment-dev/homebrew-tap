require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.5-darwin-x64.tar.gz"
    sha256 "594ff659f120ae4215030df4753db218e59537819ce229018db1eccf621c1dea"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.5-darwin-arm64.tar.gz"
      sha256 "0e676044480689de0c8a29f8f9d350fdfad36a8b1a9cf339e8dcdd9384b3222a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.5-linux-x64.tar.gz"
    sha256 "35ae6272e88dd1bdcf1bf298a2b4a3e0806628ea3bd60dc6845f9505d93ac5d7"
  end
  version "2024.7.5"
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
