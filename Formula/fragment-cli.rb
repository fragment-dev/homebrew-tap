require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.31-1-darwin-x64.tar.gz"
    sha256 "87411b052547bd2e35ac8639eed7528084bdac1b17b64f2a810f120da63878ef"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.31-1-darwin-arm64.tar.gz"
      sha256 "ec2ade1d094f18bacea44e27d7ac512499448a43a9270aead0bcdf6e13a52223"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.31-1-linux-x64.tar.gz"
    sha256 "c99c17a9602a50296d962b5b526fdda02d627baaa26f53b450fe8c5907ffc7aa"
  end
  version "2024.5.31-1"
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
