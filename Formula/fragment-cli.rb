require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.4-darwin-x64.tar.gz"
    sha256 "34b52369db522a89054ca2fb049234effde21d7baede94ab0a2d945b7e42e109"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.4-darwin-arm64.tar.gz"
      sha256 "9fff6d9deabfa5a925ab1db2331f9222d7ede3d2d7b0ef80bf1627ecb46e6fe3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.4-linux-x64.tar.gz"
    sha256 "b11ae4a69ba7def4da589cffe3523135feff6b4caba3afba59e8eb34263d7e5f"
  end
  version "2024.6.4"
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
