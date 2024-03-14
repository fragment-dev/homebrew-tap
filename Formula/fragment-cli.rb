require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.14-darwin-x64.tar.gz"
    sha256 "dbdc01c94bfe35d877f9289165a4d62a81484043993bafa60be45b5c00e83ef6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.14-darwin-arm64.tar.gz"
      sha256 "036a9c555a21e2db7d56662379aa600c33d9ba901c8ea6d19382fa764eebb312"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.14-linux-x64.tar.gz"
    sha256 "8f9c6b3bb1c8d99f03097c4b95f0988af31e84bfc7c0016e36c8dcdb1d23aef8"
  end
  version "2024.3.14"
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
