require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4225.0.0-darwin-x64.tar.gz"
    sha256 "fbe9b41f910d7c10c9d7fe661b99bc122ae7bf94fa5821b0e7f7a3e07ecb3f1e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4225.0.0-darwin-arm64.tar.gz"
      sha256 "3654d06e2c9bc48a13c604155336327ad42872afcc79db686b3099d506aa93ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4225.0.0-linux-x64.tar.gz"
    sha256 "2ba1a35f0a8a86c324b63110b8abf36621bfbf8cc85b015d4fdd41b8051f706d"
  end
  version "4225.0.0"
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
