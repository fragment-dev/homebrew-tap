require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4601.0.0-darwin-x64.tar.gz"
    sha256 "e0dfe786a7fc67c4f019f61a356e262a675ab4065e04f39708be42eaead04a8a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4601.0.0-darwin-arm64.tar.gz"
      sha256 "64e688d83d9708001b4685115c8ed388d20064244ed66a1fbe905d5e0bd7c2d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4601.0.0-linux-x64.tar.gz"
    sha256 "1933855edefaddf9b725828b0bde781f2eecf8485ab7a5ddc330a046990f38e9"
  end
  version "4601.0.0"
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
