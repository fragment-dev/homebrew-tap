require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.13-2-darwin-x64.tar.gz"
    sha256 "e0003013e52b08305fb1c8b1895159a809cd45e03c95e1ecbcd7be1ad77c77e5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.13-2-darwin-arm64.tar.gz"
      sha256 "1af78377f3b3b43703ab2f2b9ced3ff52a383f4000a8652d609abd98916502e2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.13-2-linux-x64.tar.gz"
    sha256 "187253b9d1c978ba99b615ff26807cb1d76fd4a4e4006bdcf10d8baf045634d8"
  end
  version "2024.6.13-2"
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
