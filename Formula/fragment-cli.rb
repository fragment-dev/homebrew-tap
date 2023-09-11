require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.11-darwin-x64.tar.gz"
    sha256 "29ed2617f40a8d9faf13a0091029cb76e7a75a71f5fa2a2d9f83ddc8afad257c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.11-darwin-arm64.tar.gz"
      sha256 "0c1c4bf3ed01df306d27bdb8bd9a2c5bde13bce6d03f8933fbc79d9b95ce0876"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.11-linux-x64.tar.gz"
    sha256 "4b00029844e5781d55e8ea9a9335047a2da7d2dc205d868cf0095a3acfe527b0"
  end
  version "2023.9.11"
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
