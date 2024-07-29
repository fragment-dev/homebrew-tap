require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.26-darwin-x64.tar.gz"
    sha256 "a84660e00a088fee7ab82748eb42b398b0382d10abef0713b3e6ac75ca3fbe25"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.26-darwin-arm64.tar.gz"
      sha256 "d5cdff40722d3bdbade22946cb45d7e197c800e690d3f66e6f01bfa4497f0b70"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.26-linux-x64.tar.gz"
    sha256 "67a2f1bf74b5e6f2334d9fa264df3957c31e68fb732787e829aec84d15288d9a"
  end
  version "2024.7.26"
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
