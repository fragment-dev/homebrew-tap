require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.21-darwin-x64.tar.gz"
    sha256 "c81d8d79350eeb55c2b37f5f6f698731ea56fb516bd99db7f0f938ed7c159684"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.21-darwin-arm64.tar.gz"
      sha256 "d8f2c678b3a649ecb945a4b4957a4bd0755b50d8a153f0157c7504ec84fd3783"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.21-linux-x64.tar.gz"
    sha256 "182114aef138abb2a40b82fa8604772394450131247580fa7220eab2ae67b8c5"
  end
  version "2024.12.21"
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
