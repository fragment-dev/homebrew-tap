require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.11-darwin-x64.tar.gz"
    sha256 "5183a5ea9a096bc486e55b7c1a91037a636d00683fa261ca6a3a0ab8f17e5ac8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.11-darwin-arm64.tar.gz"
      sha256 "f592c6532af658f35627a64da2b7a313053ea1c5cbc62dc623de89977c7cb5ac"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.11-linux-x64.tar.gz"
    sha256 "0038dd7642ba41402307d19683288cd3914e015d2e8d75e98cd3f5d28d2f5516"
  end
  version "2024.12.11"
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
