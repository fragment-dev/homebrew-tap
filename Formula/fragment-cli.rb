require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.24-darwin-x64.tar.gz"
    sha256 "52381acf754dacdef43cf299915bba59bc91ec1c2d5f08740a5ae970d8d568b3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.24-darwin-arm64.tar.gz"
      sha256 "ab7df34a6a6353c8397d8a56f7b24f00f330952208c1fccc7e5575370393bbe1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.24-linux-x64.tar.gz"
    sha256 "e50a421b1b46b4b89f6d4053d20d85383915f8f730a433c27ffc381cd9c33fcd"
  end
  version "2023.7.24"
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
