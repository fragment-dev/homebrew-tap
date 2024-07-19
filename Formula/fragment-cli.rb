require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.19-1-darwin-x64.tar.gz"
    sha256 "28c64a2b36052aeae5fa0dcb7891b08b22d878a03f3af8154563c53fa09fc2e0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.19-1-darwin-arm64.tar.gz"
      sha256 "c0bc9f67e40b37f012ce7aa99f7a2e68bf66c3e309f6290e0136931856f7c712"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.19-1-linux-x64.tar.gz"
    sha256 "a7580f09adbca22dd001654c2cd0a44d2bc34bb5a221711382b4ec58788a9ae6"
  end
  version "2024.7.19-1"
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
