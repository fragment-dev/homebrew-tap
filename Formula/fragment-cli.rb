require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.22-darwin-x64.tar.gz"
    sha256 "e79278f1e7d0a3f114d12cd7b9908b9ab3c1ab443223c4386b6c68cddc5b7bd2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.22-darwin-arm64.tar.gz"
      sha256 "ff5a5d7e01c30e994035ddd75fa25b1b029d42fff614b619f4cbe0c1f21018e8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.22-linux-x64.tar.gz"
    sha256 "a05f10d21cf2780ea3ec0d845870e9abb1c9ed51d0ca5c98822f7f3c8c4b87c1"
  end
  version "2023.4.22"
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
