require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.6-1-darwin-x64.tar.gz"
    sha256 "eb22ceca485aaa5f599c56f66e6f747fc1f03c7d6dc1c7b96669ceef07032a61"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.6-1-darwin-arm64.tar.gz"
      sha256 "5d9b749ae75a800cbdccb654af110e4be3765668aa4bf7ae1b5c058dd29fb20f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.6-1-linux-x64.tar.gz"
    sha256 "c2270e5a97791c595136f1bf7c279571185045013fc31fac59de94e896a1ef1d"
  end
  version "2024.8.6-1"
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
