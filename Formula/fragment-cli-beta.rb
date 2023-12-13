require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4152.0.0-darwin-x64.tar.gz"
    sha256 "7c5e14a158f265428ad6f67b6aeb9ebbbacc5f6da77bdb4838d43668b024bb14"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4152.0.0-darwin-arm64.tar.gz"
      sha256 "a77c7a77e616a7d2667f75444a837966feab47a8edd01d111c01a63a840334d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4152.0.0-linux-x64.tar.gz"
    sha256 "e4dc6b0273c656a6bf3f3ca62820db331f6f5a89fc3e3e91a2f48638bad87294"
  end
  version "4152.0.0"
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
