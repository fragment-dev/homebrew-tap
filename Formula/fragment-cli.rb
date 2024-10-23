require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.23-2-darwin-x64.tar.gz"
    sha256 "d9b11bfbdd7883548ce1efa946c1532e9c441100e84978a4d83b56b09beec8ec"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.23-2-darwin-arm64.tar.gz"
      sha256 "b6045ec57daefbc28ad1f3943da6f5969a1d17257b6c101ee4c9f0becbed6503"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.23-2-linux-x64.tar.gz"
    sha256 "c8aaa9c62c5a0b0b126a437f7f328e8dac50d2f6d597f235fa3e76b19861dd32"
  end
  version "2024.10.23-2"
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
