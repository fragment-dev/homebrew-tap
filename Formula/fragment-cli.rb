require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.11-1-darwin-x64.tar.gz"
    sha256 "659603ed54357928bcaa4d14a618b8875ebc910c32b6c1567aa21b68d0811c00"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.11-1-darwin-arm64.tar.gz"
      sha256 "28f073c7b654fd90e1e3d867abdb5d9d3fc7f7814b4f5a05d300bf9a5856bcf6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.11-1-linux-x64.tar.gz"
    sha256 "0bdd07908626dd128cda775209680932e48dbbb12f76bfcc1dab832082690b5b"
  end
  version "2024.6.11-1"
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
