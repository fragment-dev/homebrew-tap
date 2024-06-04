require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.4-3-darwin-x64.tar.gz"
    sha256 "e442f143d37cb3797200b05de30cc84d802d1ad7e0191737bcb468663cbe3d6b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.4-3-darwin-arm64.tar.gz"
      sha256 "65dbface3047f152d7b0c70930d0a2d23b2795619ed9683c3f3a892d4b5f3b1a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.4-3-linux-x64.tar.gz"
    sha256 "093af5a5e44071eac164bd4b4f19ee069db0cf35456af8ee16a2185072420aeb"
  end
  version "2024.6.4-3"
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
