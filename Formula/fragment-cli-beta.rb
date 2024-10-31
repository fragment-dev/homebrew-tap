require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5713.0.0-darwin-x64.tar.gz"
    sha256 "7d366cff01e85aaa5a54c01df61514042ba8729ca7f31172c23454392c37aa93"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5713.0.0-darwin-arm64.tar.gz"
      sha256 "6d839022983e632f7482d6edc623d11e419a58a8321037a84516ac1889ff6a84"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5713.0.0-linux-x64.tar.gz"
    sha256 "3035751b7bb3c900c8f6fbd98b1392f0d4b2bce49cbdee06a82cd97e42635ba4"
  end
  version "5713.0.0"
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
