require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.10-1-darwin-x64.tar.gz"
    sha256 "b098fc73832fd437d68dc1cd3befb9000e32dd7f04be222150e976afa210004c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.10-1-darwin-arm64.tar.gz"
      sha256 "7e1a2bba7ec00e19b841ce493d6a46fc22917994c60b2ad3ec267b222ed48833"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.10-1-linux-x64.tar.gz"
    sha256 "4cb740f5905b9b46691a192ea89f377b63b94365785f6c6b445a5006c2931339"
  end
  version "2024.6.10-1"
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
