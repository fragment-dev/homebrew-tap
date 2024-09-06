require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.5-darwin-x64.tar.gz"
    sha256 "b10cbe6a7e4a4dc413c248b5cab2ee1e39a2ef70b4c16dae3c9a570b8488d3b9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.5-darwin-arm64.tar.gz"
      sha256 "8999c582de535ba2b96c892bf1e11508712b35195d9ade2d6c7c508add952595"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.5-linux-x64.tar.gz"
    sha256 "54761a473ef0ececfee3d8e18db713579e3cb6509d23e904028ad5d8bd58dd83"
  end
  version "2024.9.5"
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
