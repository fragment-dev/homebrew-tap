require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.12-darwin-x64.tar.gz"
    sha256 "c43fca816f12b683f45f0558b2c06187045d572c8cb899301e6a54beac44bbc1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.12-darwin-arm64.tar.gz"
      sha256 "ab98967df49713ca795c4b023d7e9f8b211a6d4f964f7cd1a743d937858c7800"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.12-linux-x64.tar.gz"
    sha256 "d48ed4c458e1e5d31d46eb471427e96cedb43cccb80b5755ab977963b57b6438"
  end
  version "2024.4.12"
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
