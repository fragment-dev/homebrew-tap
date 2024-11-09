require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5757.0.0-darwin-x64.tar.gz"
    sha256 "ded7363bb9de5319511aab0c4c84038fe1d814188b9ef91453d718df2586e9dd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5757.0.0-darwin-arm64.tar.gz"
      sha256 "b6965c43cb380b3123966651f7f4b75c195286f21d70466c095480e6dff0ffc7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5757.0.0-linux-x64.tar.gz"
    sha256 "7a89b3e3e30e36c08cac27c675e2814a0a664c7f271e91fa5bd7586eb9d6f008"
  end
  version "5757.0.0"
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
