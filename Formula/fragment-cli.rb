require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.6-1-darwin-x64.tar.gz"
    sha256 "021ce8f03740ed77233436fc10bc6b953aff8fa0bc7110d12613bda928a94bd7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.6-1-darwin-arm64.tar.gz"
      sha256 "2eeee4c3dbdf233bfad8ee62f9acda3533f29eb060659e81982b74367597fee1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.6-1-linux-x64.tar.gz"
    sha256 "0d0fe80065512780776cea86d0fadead0a21927c1a13209303767d6ef33049ac"
  end
  version "2024.5.6-1"
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
