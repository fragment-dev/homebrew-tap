require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.3.27-1-darwin-x64.tar.gz"
    sha256 "159dab86a855f22288077f88bb1755ed463e417d5efce4dae3959bb51c43d3ca"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.3.27-1-darwin-arm64.tar.gz"
      sha256 "67dbf4837c34caa5bb9dee1f9e4c1cfbf7dd48e5008f7456969a1098aacfc1d5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.3.27-1-linux-x64.tar.gz"
    sha256 "3e18a1d19f1fdfb886881b98ad8519e8dde9fa000589e766b267c6de6767ca03"
  end
  version "2026.3.27-1"
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
