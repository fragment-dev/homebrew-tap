require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4299.0.0-darwin-x64.tar.gz"
    sha256 "9895f8f47317dc2e7ffb4a5405951168ff592d1c41ae2492aa620b989ed0a044"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4299.0.0-darwin-arm64.tar.gz"
      sha256 "676b4c60d1e8a8e255ff073520926af0161470798a920b4403029da9cbc41ef0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4299.0.0-linux-x64.tar.gz"
    sha256 "7dfb00b5e1966f34221eb4a346dfbdefc10526912fe5d8d4954bb4120d7e6ae6"
  end
  version "4299.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
