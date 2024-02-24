require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.24-darwin-x64.tar.gz"
    sha256 "3c2192711d10109f2d4c0425ebce13362f0765ace78fbb3a6149ea7df843a83a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.24-darwin-arm64.tar.gz"
      sha256 "cee2c4c352d0ab44df679834622b39d1a09157a61cc2a5d53f652144cc957bc0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.24-linux-x64.tar.gz"
    sha256 "a9b04af23dce7aab44c911ad2728f9ef2575d3ce05d5c9940ee9ee614da708b1"
  end
  version "2024.2.24"
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
