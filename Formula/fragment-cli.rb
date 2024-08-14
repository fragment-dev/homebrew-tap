require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.14-1-darwin-x64.tar.gz"
    sha256 "80659203c87569c31d58e087d9d9360438855017ba63c064b5e2f18c42d05df3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.14-1-darwin-arm64.tar.gz"
      sha256 "c977abc157318718a0237489e9a4142b471888bd3907ecfe6c51d6c92b914fce"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.14-1-linux-x64.tar.gz"
    sha256 "de1c7a96755a92e68bbc9d20bad28f0cd94d3c7fef33a60530dee44347a2883d"
  end
  version "2024.8.14-1"
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
