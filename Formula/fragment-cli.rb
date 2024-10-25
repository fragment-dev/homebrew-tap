require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.25-darwin-x64.tar.gz"
    sha256 "f8bb95168ae705ba8b2aaeaebbf57eca494cd23e658dd35a57863f2fbcab6c34"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.25-darwin-arm64.tar.gz"
      sha256 "f6889a2de3a39d22316a4a2c05fcb136a04857acbb80fcbdb239f15baf56882f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.25-linux-x64.tar.gz"
    sha256 "6296b653a8bb8ae96dde90b72d11fa297a55911140d965176b940e5926b09d44"
  end
  version "2024.10.25"
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
