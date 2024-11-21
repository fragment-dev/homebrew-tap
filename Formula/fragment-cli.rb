require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.20-1-darwin-x64.tar.gz"
    sha256 "9414bbf0350f8a1376d4f645d0ebcccb4730dfb347414ae800289c40c47bc77e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.20-1-darwin-arm64.tar.gz"
      sha256 "c26ef20e2d0b7a785de91f9a7a772cec1ef9b164f623768336d2578d5605ae7a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.20-1-linux-x64.tar.gz"
    sha256 "5519b38e10bd2389e3c99b48fbe398c7140c29164907428b600820a955e09bf6"
  end
  version "2024.11.20-1"
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
