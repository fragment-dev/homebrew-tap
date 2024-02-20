require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.20-darwin-x64.tar.gz"
    sha256 "60a3b8eb416141c6f1d335b95f0773b5fa90040ee87fe9f5966a601ee62bd0f6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.20-darwin-arm64.tar.gz"
      sha256 "755e0c4ccedd558cf34511d8d81649e9c16ae5678e1a33a079f9a6bc013356dd"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.20-linux-x64.tar.gz"
    sha256 "decdc4be8b074c4dbf868d6aaf105bf5ee9d52a2d3b196f26afb215a4334b43c"
  end
  version "2024.2.20"
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
