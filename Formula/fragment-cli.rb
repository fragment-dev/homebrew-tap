require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.13-darwin-x64.tar.gz"
    sha256 "59e43dd64b457cd9c8792c84af45a724e02d6543f1757f837ec2e7266780b750"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.13-darwin-arm64.tar.gz"
      sha256 "11f518d4a93f48c4b9cf14276458f11f25ca31c716d9c05aaeb5d3697e56868e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.13-linux-x64.tar.gz"
    sha256 "37b7c7dc0e3fa3b74f0e81794aaf27fb1b076afe4e4d3ce0f67afb8e89c5a9c7"
  end
  version "2024.11.13"
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
