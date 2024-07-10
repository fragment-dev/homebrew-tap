require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.10-darwin-x64.tar.gz"
    sha256 "d93802ae78857b86c83bedd292c5d4f6e3d9beaf2f74ea0038a1595d754389c1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.10-darwin-arm64.tar.gz"
      sha256 "a9dc61ed9e99652247c9b07ca0260c38a923c087b7b666f2aeb9d23cb3921c09"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.10-linux-x64.tar.gz"
    sha256 "449c6d0b44e3b6387f3c4982cdfcfbb0e1c49d829a952932cf491ace47533d56"
  end
  version "2024.7.10"
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
