require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.26-darwin-x64.tar.gz"
    sha256 "e4158718258496eca4e31e75cd886eeeb4ed9a7c64ca62a54f67ee8597438ec0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.26-darwin-arm64.tar.gz"
      sha256 "37d5a7f6dcd82f7bd67ef37a0fdd75dfb68be45b0c24d2ebfbd32b88c0cbefd4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.26-linux-x64.tar.gz"
    sha256 "57b2fec97d6bdc76fd7678f5e731f7eb4ebdc0e9121652100f8a849035587484"
  end
  version "2024.6.26"
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
