require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-2-darwin-x64.tar.gz"
    sha256 "20e4812761be91c1850881e45f6776a7f4150c8d96aed3f5f253e502a9009fb9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-2-darwin-arm64.tar.gz"
      sha256 "4c25babeb3614936908d3f832bfdcfcd2218f2d380ade90861c8b18595ee0acf"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-2-linux-x64.tar.gz"
    sha256 "2fcc7d58ef0490fe10e84a60ac9d6e7d2637dc9d327addb3a896b422d0cbc7c5"
  end
  version "2024.12.19-2"
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
