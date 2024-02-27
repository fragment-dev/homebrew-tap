require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.26-darwin-x64.tar.gz"
    sha256 "39c0fefcabcc2cdfcc15252013d73281be5c7d33e154b2c39cf7f8f2d0c476a5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.26-darwin-arm64.tar.gz"
      sha256 "3105e701afdc62f28ddcd8534207e92cf78e3197d7e90e9ed60d9a0c38e98743"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.26-linux-x64.tar.gz"
    sha256 "c9f96eea1eb57436c06ae9a7d2c31c041718e99723777666a068b26b7afc48a8"
  end
  version "2024.2.26"
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
