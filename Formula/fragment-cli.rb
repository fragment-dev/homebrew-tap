require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.28-1-darwin-x64.tar.gz"
    sha256 "222b6349f80503fa1a52fe07829a9e5252ee1b76f5f39aea628578957c14903f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.28-1-darwin-arm64.tar.gz"
      sha256 "2437b3b98b15c41b0d4fba4c69990f1246bd7bc3df99f35a7d96c83d772f3a69"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.28-1-linux-x64.tar.gz"
    sha256 "9598808159409e5b97d5178524bed8215e9591d539c5b619cf55e0c7e5c070bd"
  end
  version "2023.8.28-1"
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
