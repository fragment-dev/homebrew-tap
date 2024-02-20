require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.20-1-darwin-x64.tar.gz"
    sha256 "e01b79dfbd40921636ed793ac7a41e83a6381f3f4dbc78e5ec9c7f5038c19bc4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.20-1-darwin-arm64.tar.gz"
      sha256 "dfb280327e84673f2d498969557cd646fb430c6b37451f4a243e1dee2180c221"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.20-1-linux-x64.tar.gz"
    sha256 "e1d6d4fbdbf02fc6cdbb924825258c420504388d021c9e140352e12729e7d369"
  end
  version "2024.2.20-1"
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
