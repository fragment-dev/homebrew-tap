require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.5-2-darwin-x64.tar.gz"
    sha256 "f3c80063585306162964142c7e1c57f7dd66898c115cf51e3b4acdaec77a1a6e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.5-2-darwin-arm64.tar.gz"
      sha256 "0a2faf7b9926fecb6828a9365ba3077fe78fcffb713aef75e3970d889a02d2bb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.5-2-linux-x64.tar.gz"
    sha256 "de3b16e60e0046edd3063d295ffc2b1eaec3899396caec17b0faa3add18a2850"
  end
  version "2024.11.5-2"
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
