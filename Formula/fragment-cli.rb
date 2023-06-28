require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.28-darwin-x64.tar.gz"
    sha256 "51b37634467232b837a5da0848cfdcd0cc012b6707e79b8dd0c28f49bd3f6fa0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.28-darwin-arm64.tar.gz"
      sha256 "f7aa94321fb5906f73276d9b7106ea937d95726d180e396156fd9802041f82d7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.28-linux-x64.tar.gz"
    sha256 "9b79026cf324be9e2595817efd53fa25a91bb22c41934ee437988a20ad55df8e"
  end
  version "2023.6.28"
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
