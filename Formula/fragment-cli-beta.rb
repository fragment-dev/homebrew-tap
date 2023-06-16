require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2867.0.0-darwin-x64.tar.gz"
    sha256 "f206c12dc1aec22c20e1b1942f27a40a2d97866e37a691c05bf1bd9a37f9014f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2867.0.0-darwin-arm64.tar.gz"
      sha256 "b384b73fd8fe63efc69671a786999a74762fed5a6695019279c6ad0da7be93e4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2867.0.0-linux-x64.tar.gz"
    sha256 "730ccdf7a1b30588675e3cb045ea559760ba0d1aef4dc7757a1920cd0bb316c8"
  end
  version "2867.0.0"
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
