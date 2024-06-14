require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5279.0.0-darwin-x64.tar.gz"
    sha256 "954947d0477ff521a5817761aad1e14c054c2553c05e32282d868bcb5550216c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5279.0.0-darwin-arm64.tar.gz"
      sha256 "a3eab959071c9d997eb62b5bf2d8d036e143d94493f0c802837ba7d2f75d0f72"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5279.0.0-linux-x64.tar.gz"
    sha256 "5ec70ff20819cae9da1f2c56fde10b66a8dbefcd0156d11a001eb83ed76f3674"
  end
  version "5279.0.0"
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
