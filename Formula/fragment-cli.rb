require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.12-1-darwin-x64.tar.gz"
    sha256 "1956018006903d3815f4582ec4ba14abab6d78fa40c1444cc1334502d86dc110"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.12-1-darwin-arm64.tar.gz"
      sha256 "3f30afa2f0a3309ed87ee244b099af45899c7580e8fdcdb510758eea859fc641"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.12-1-linux-x64.tar.gz"
    sha256 "bcecc78c683064f26bedd78506f45a7a15c9a7f7241cc5f9335457b4307e34dc"
  end
  version "2024.3.12-1"
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
