require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5835.0.0-darwin-x64.tar.gz"
    sha256 "22cb995d0ab1358410c0bd07b44989ff8584ddbec6402e77ff56cbcd3c525559"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5835.0.0-darwin-arm64.tar.gz"
      sha256 "01887bb38da0224b0fb15d57ac0299c0c22e383af5ca1751b9725aa293ac15f7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5835.0.0-linux-x64.tar.gz"
    sha256 "d3e9c6b96e8057639d07889b950265dce2222c52263ae8b5e6e89b772c694fb8"
  end
  version "5835.0.0"
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
