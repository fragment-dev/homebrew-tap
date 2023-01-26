require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1841.0.0-darwin-arm64.tar.gz"
    sha256 "882c8f4f9df58f42da10142f74615777fd5f91eb5442ecb15b57cc5c404aacd3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1841.0.0-darwin-arm64.tar.gz"
      sha256 "c588729dee9bc6da69057a1f9c1d55126104c8c515437f9dd650dc62e0246780"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1841.0.0-darwin-arm64.tar.gz"
    sha256 "d843aefe101d7c80ede29a37b6ae12a7b3cba37cd71ba1e1ee293ce4091ad15b"
  end
  version "1841.0.0"
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
