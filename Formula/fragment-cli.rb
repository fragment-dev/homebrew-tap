require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.1-1-darwin-x64.tar.gz"
    sha256 "3998187471bded42e9ce5dfbab89448879c8f04551d70522a2d138e3658ca273"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.1-1-darwin-arm64.tar.gz"
      sha256 "526f588918ab722c8e4eb01087be6de4d59d94ba9247263a3710d3a82f0fef4a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.1-1-linux-x64.tar.gz"
    sha256 "bba7074dea2d311454c12325876a2493c64bc7db58d655204903c46326aa0ef9"
  end
  version "2024.8.1-1"
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
