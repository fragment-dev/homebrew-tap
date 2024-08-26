require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.26-darwin-x64.tar.gz"
    sha256 "23072c84166fbd2c996d9ab074d7dff88257d85db41923069efd4f094e17429e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.26-darwin-arm64.tar.gz"
      sha256 "553cc1c5e4939211845eacb7376828d2772c244b07ffddf2e5014fe8342af5da"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.26-linux-x64.tar.gz"
    sha256 "9c1ef844c566cacc2714e6c6a6c7ae3f9acebd1dbc2f9908656b7e4e016a91d6"
  end
  version "2024.8.26"
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
